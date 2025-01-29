import { Request, Response } from "express";
import { eq } from "drizzle-orm";
import { asyncHandler } from "@/utils/asyncHandler";
import { ApiError } from "@/utils/ApiError";
import { db } from "@/drizzle/db";
import { productsTable } from "@/drizzle/schema";
import { ApiResponse } from "@/utils/ApiResponse";
import { sendError } from "@/utils/sendError";

export const createProduct = asyncHandler(
  async (req: Request, res: Response) => {
    const {
      storeId,
      categoryId,
      name,
      subTitle,
      price,
      stockQuantity,
      sku,
      slug,
      discount,
      features,
      variants,
      status,
      imageFileId,
    } = req.body;

    try {
      if (!storeId || !categoryId || !name || !price) {
        throw new ApiError(
          400,
          "storeId, categoryId, name, and price are required",
        );
      }

      // Checking if the product with the same slug already exists
      const existingProduct = await db
        .select()
        .from(productsTable)
        .where(eq(productsTable.slug, slug));

      if (existingProduct.length) {
        throw new ApiError(400, "Product with this slug already exists");
      }

      // Get the current timestamp for createdAt
      const createdAt = new Date();

      // Inserting the new product
      const createdProduct = await db
        .insert(productsTable)
        .values({
          storeId,
          categoryId,
          name,
          subTitle,
          price,
          stockQuantity,
          sku,
          slug,
          discount,
          features,
          variants,
          status,
          createdAt,
          imageFileId,
        })
        .returning({
          id: productsTable.id,
          storeId: productsTable.storeId,
          categoryId: productsTable.categoryId,
          name: productsTable.name,
          subTitle: productsTable.subTitle,
          price: productsTable.price,
          stockQuantity: productsTable.stockQuantity,
          sku: productsTable.sku,
          slug: productsTable.slug,
          discount: productsTable.discount,
          features: productsTable.features,
          variants: productsTable.variants,
          status: productsTable.status,
          createdAt: productsTable.createdAt,
          imageFileId: productsTable.imageFileId,
        });

      if (!createdProduct.length) {
        throw new ApiError(
          500,
          "Something went wrong while creating the product",
        );
      }

      return res
        .status(201)
        .json(
          new ApiResponse(201, createdProduct, "Product created successfully"),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);
