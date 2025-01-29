export interface IProduct {
  id: string;
  storeId: string;
  categoryId: string;
  name?: string;
  subTitle?: string;
  price?: number;
  stockQuantity?: number;
  sku?: string;
  slug?: string;
  discount?: number;
  features?: string;
  variants?: any; // You can replace `any` with a specific type if you define the structure of variants
  status?: string;
  createdAt?: Date;
  imageFileId?: string;
}
