import { prisma } from '@/lib/prisma.js'

type CreateUserData = {
  name: string
  email: string
  password_hash: string
}

export class PrismaUsersRepository {
  async findByEmail(email: string) {
    const user = await prisma.user.findUnique({
      where: {
        email,
      },
    })
    return user
  }

  async create(data: CreateUserData) {
    const user = await prisma.user.create({
      data,
    })
    return user
  }
}

/**
 Se qualquer metodo precisar de alguma typagem do "CreateUserData" podemos usar sem problema. Foi o caso do metodo findByEmail.
 * 
 */
