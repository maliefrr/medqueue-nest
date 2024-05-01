-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(36) NOT NULL,
    `nama` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `tempat_lahir` VARCHAR(50) NOT NULL,
    `tgl_lahir` DATETIME(3) NOT NULL,
    `no_bpjs` VARCHAR(18) NOT NULL,
    `gender` VARCHAR(1) NOT NULL,
    `no_nik` VARCHAR(20) NOT NULL,
    `gol_darah` VARCHAR(1) NOT NULL,
    `no_telepon` VARCHAR(18) NOT NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    UNIQUE INDEX `users_no_nik_key`(`no_nik`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
