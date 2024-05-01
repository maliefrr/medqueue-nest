/*
  Warnings:

  - You are about to drop the `schedule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `schedule`;

-- CreateTable
CREATE TABLE `schedules` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_poli` VARCHAR(50) NOT NULL,
    `hari` ENUM('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY') NOT NULL,
    `jam_buka` VARCHAR(10) NOT NULL,
    `jam_tutup` VARCHAR(10) NOT NULL,
    `kuota` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userID` VARCHAR(191) NOT NULL,
    `poli_klinik` VARCHAR(50) NOT NULL,
    `tanggal_daftar` DATETIME(3) NOT NULL,
    `scheduleID` INTEGER NOT NULL,
    `keluhan` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_scheduleID_fkey` FOREIGN KEY (`scheduleID`) REFERENCES `schedules`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
