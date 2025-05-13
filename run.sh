mkdir -p ~/bin && cat > ~/bin/run << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

FILE="$1"
shift
ARGS="$@"

VERSION="v1.0.0 - last updated: 2025-05-13"

show_help() {
cat <<END
[ run - Simple multi-language file runner ]

Usage:
  run file.ext [args...]   Run the file based on extension
  run -c                   Configure this script using nano
  run -d                   Disable the run script
  run -e                   Enable the run script
  run -l                   List supported languages
  run -s                   Show run script status
  run -v                   Show version and last update info
END
}

if [[ "$FILE" == "-c" ]]; then
  nano "$HOME/bin/run"
  exit
elif [[ "$FILE" == "-d" ]]; then
  mv "$HOME/bin/run" "$HOME/bin/run.disabled"
  echo "[ ✓ ] 'run' script has been disabled, type 'bash ~/bin/run.disabled -e' to re-enable multi-language runner"
  exit
elif [[ "$FILE" == "-e" ]]; then
  mv "$HOME/bin/run.disabled" "$HOME/bin/run"
  chmod +x "$HOME/bin/run"
  echo "[ ✓ ] 'run' script has been re-enabled."
  exit
elif [[ "$FILE" == "-l" ]]; then
  echo "[ i ] Supported languages and extensions:"
  echo "  C/C++        : .c .cpp"
  echo "  Python       : .py"
  echo "  JavaScript   : .js      | TypeScript: .ts"
  echo "  Java         : .java"
  echo "  Go           : .go"
  echo "  Ruby         : .rb      | PHP: .php"
  echo "  Rust         : .rs"
  echo "  Kotlin       : .kt .kts"
  echo "  Swift        : .swift"
  echo "  C#           : .cs"
  echo "  Dart         : .dart"
  echo "  Lua          : .lua"
  echo "  Perl         : .pl"
  echo "  R            : .r"
  echo "  Julia        : .jl"
  echo "  Shell        : .sh"
  exit
elif [[ "$FILE" == "-s" ]]; then
  echo "[ i ] Run script status:"
  file="$HOME/bin/run"
  [[ -f "$file" ]] || file="$file.disabled"
  ls -l "$file"
  echo "Location : $file"
  echo "Size     : $(du -h "$file" | cut -f1)"
  echo "SHA256   : $(sha256sum "$file" | cut -d' ' -f1)"
  exit
elif [[ "$FILE" == "-v" ]]; then
  echo "[ run $VERSION ]"
  exit
elif [[ "$FILE" == "" ]]; then
  show_help
  exit
fi

EXT="${FILE##*.}"
NAME="${FILE%.*}"

case "$EXT" in
  cpp)    g++ "$FILE" -o run.out && ./run.out $ARGS ;;
  c)      gcc "$FILE" -o run.out && ./run.out $ARGS ;;
  py)     python "$FILE" $ARGS ;;
  js)     node "$FILE" $ARGS ;;
  ts)     ts-node "$FILE" $ARGS ;;
  java)   javac "$FILE" && java "$NAME" $ARGS ;;
  go)     go run "$FILE" $ARGS ;;
  rb)     ruby "$FILE" $ARGS ;;
  php)    php "$FILE" $ARGS ;;
  rs)     rustc "$FILE" -o run.out && ./run.out $ARGS ;;
  kt|kts) kotlinc "$FILE" -include-runtime -d run.jar && java -jar run.jar $ARGS ;;
  swift)  swift "$FILE" $ARGS ;;
  cs)     mcs "$FILE" -out:run.exe && mono run.exe $ARGS ;;
  dart)   dart run "$FILE" $ARGS ;;
  lua)    lua "$FILE" $ARGS ;;
  pl)     perl "$FILE" $ARGS ;;
  r)      Rscript "$FILE" $ARGS ;;
  jl)     julia "$FILE" $ARGS ;;
  sh)     bash "$FILE" $ARGS ;;
  *)
    echo "[ ! ] Error: Unsupported file type"
    ;;
esac
EOF

chmod +x ~/bin/run && \
{ grep -qxF 'export PATH=$HOME/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc; } && \
{ grep -qxF "alias r='run'" ~/.bashrc || echo "alias r='run'" >> ~/.bashrc; } && \
source ~/.bashrc