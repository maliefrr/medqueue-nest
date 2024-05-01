-- CreateTable
CREATE TABLE `Queue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userID` VARCHAR(191) NOT NULL,
    `reservationID` INTEGER NOT NULL,
    `kuota` INTEGER NOT NULL,
    `terisi` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Queue` ADD CONSTRAINT `Queue_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Queue` ADD CONSTRAINT `Queue_reservationID_fkey` FOREIGN KEY (`reservationID`) REFERENCES `reservations`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
