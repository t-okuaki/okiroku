import { ItemType } from "@/entities/item/api/types";

export async function Item({ item }: { item: ItemType }) {
  return (
    <div className="space-y-1">
      <div>{item.name}</div>
      <div className="space-x-2">
        <div className="inline-block">
          <input
            type="number"
            name={`item-count-${item.id}`}
            className="rounded border border-gray-100 bg-transparent px-2 py-1"
          />
        </div>
      </div>
    </div>
  );
}
