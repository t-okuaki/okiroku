export type PaymentType = {
  id: number;
  price: number;
  created_at: string;

  payment_items: {
    id: number;
    name: string;
    price: number;
    count: number;
    space_name: string;

    payment_item_works: {
      id: number;
      name: string;
      count: number;
    }[];
  }[];
};
