import { prisma } from "../utils/prisma";


async function getAllUsers() {
    return await prisma.users.findMany();
}

async function getUser(id: number) {
    let user = await prisma.users.findUnique({
        where: {
            id: id,
        },
        select: {
            id: true,
            first_name: true,
            second_name: true,
            email:true
        }
    })
}