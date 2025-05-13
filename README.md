# 🚀 simple-multicode-runner

**simple-multicode-runner** is a lightweight Bash script that lets you compile and run source code files across multiple programming languages using a single command. It automatically detects the file extension and invokes the appropriate compiler or interpreter, streamlining your development workflow.

---

## 🧰 Features

- **Multi-language support**: C, C++, Python, JavaScript, TypeScript, Java, Go, Ruby, PHP, Rust, Kotlin, Swift, C#, Dart, Lua, Perl, R, Julia, Shell  
- **Single-command execution**: Compile and run your code without memorizing individual commands  
- **Customizable options**:
  - `-c` : Open the script in `nano` for quick configuration  
  - `-d` : Disable the script (rename `run` → `run.disabled`)  
  - `-e` : Re-enable the script (rename `run.disabled` → `run`)  
  - `-l` : List supported languages & extensions  
  - `-s` : Show script status (location, size, permissions, SHA256)  
  - `-v` : Show version & last update timestamp  
- **Argument forwarding**: Pass additional arguments directly to your program  
- **Informative error messages**: `[ ! ] Error: Unsupported file type`

---

## 📦 Installation

```bash
# 1. Clone the repository
git clone https://github.com/Sparkplugx1904/simple-multicode-runner.git

# 2. Go into the project directory
cd simple-multicode-runner

# 3. Make the script executable
chmod +x run.sh

# 4. Move it into your ~/bin (or other PATH directory)
mv run.sh ~/bin/run

# 5. Ensure ~/bin is in your PATH (add to ~/.bashrc or ~/.zshrc)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# 6. Reload your shell configuration
source ~/.bashrc
```
## 🧪 Usage
```
# Run a source file by extension
run file.ext [args...]

# Examples:
run hello.py
run program.cpp input.txt
run script.js --verbose

# Use built-in options:
run -c    # Edit the runner script in nano
run -d    # Disable the runner
run -e    # Re-enable the runner
run -l    # List supported languages
run -s    # Show runner status
run -v    # Show version & last update
```
##📄 License

This project is licensed under the GNU Affero General Public License v3.0.
See the LICENSE file for full details.
