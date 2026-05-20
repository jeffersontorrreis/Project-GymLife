/*
  Warnings:

  - The primary key for the `check_ins` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `check_ins` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `gyms` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `gyms` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `user_id` on the `check_ins` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `gym_id` on the `check_ins` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "check_ins" DROP CONSTRAINT "check_ins_gym_id_fkey";

-- DropForeignKey
ALTER TABLE "check_ins" DROP CONSTRAINT "check_ins_user_id_fkey";

-- AlterTable
ALTER TABLE "check_ins" DROP CONSTRAINT "check_ins_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL DEFAULT gen_random_uuid(),
DROP COLUMN "user_id",
ADD COLUMN     "user_id" UUID NOT NULL,
DROP COLUMN "gym_id",
ADD COLUMN     "gym_id" UUID NOT NULL,
ADD CONSTRAINT "check_ins_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "gyms" DROP CONSTRAINT "gyms_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL DEFAULT gen_random_uuid(),
ADD CONSTRAINT "gyms_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL DEFAULT gen_random_uuid(),
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "check_ins" ADD CONSTRAINT "check_ins_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "check_ins" ADD CONSTRAINT "check_ins_gym_id_fkey" FOREIGN KEY ("gym_id") REFERENCES "gyms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
