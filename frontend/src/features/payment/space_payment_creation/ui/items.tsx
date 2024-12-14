import { getItems } from "@/entities/item/api";
import { Item } from "./item";

export async function Items({ spaceId }: { spaceId: number }) {
  const items = await getItems({ spaceId });

  return (
    <div className="space-y-4">
      {items.map((item) => (
        <Item item={item} key={item.id} />
      ))}
    </div>
  );
}
