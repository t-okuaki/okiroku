import { ItemType } from "./types";

export async function getItems({ spaceId }: { spaceId: number }) {
  const response = await fetch(`http://backend:3000/spaces/${spaceId}/items`);
  const items: ItemType[] = await response.json();

  return items;
}
