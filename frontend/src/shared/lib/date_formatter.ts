// ISO 8601 形式の日時文字列を、秒単位で読みやすい形式に変換します。
// 例： `formatDateInSecondsFromISO("2024-12-14T10:26:01Z")` は `"2024年12月14日 19:26:01"` を返します。
export function formatDateInSecondsFromISO(isoString: string): string {
  const date = new Date(isoString);
  return date.toLocaleDateString("ja-JP", {
    timeZone: "Asia/Tokyo",
    year: "numeric",
    month: "long",
    day: "numeric",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
  });
}
