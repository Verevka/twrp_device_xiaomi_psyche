CLANG_DIR="prebuilts/clang/host/linux-x86/clang-13.0.0"

if [ -d "$CLANG_DIR" ]; then
  echo "Updating Clang..."
  git -C "$CLANG_DIR" pull
else
  echo "Cloning Clang..."
  git clone https://github.com/Verevka/proton-clang --depth=1 "$CLANG_DIR"
fi
