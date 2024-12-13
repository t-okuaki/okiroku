/**
 * Prettier の設定ファイルです。ドキュメントは以下です。
 * https://prettier.io/docs/en/configuration.html
 */
module.exports = {
  plugins: [
    // Tailwind CSS のクラス名をソートするプラグインです。
    // VSCode の esbenp.prettier-vscode 拡張機能の保存時自動整形（formatOnSave）で動作しない場合、
    // VSCode の再起動を試してください。
    "prettier-plugin-tailwindcss",
  ],
};
