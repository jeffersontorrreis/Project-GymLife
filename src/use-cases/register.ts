import { hash } from 'bcryptjs'
import { PrismaUsersRepository } from '@/repositories/prisma-users-repository.js'

type RegisterUseCaseRequest = {
  name: string
  email: string
  password: string
}

export async function registerUseCase({ name, email, password }: RegisterUseCaseRequest) {
  const password_hash = await hash(password, 6)

  const prismaUsersRepository = new PrismaUsersRepository()

  const userAlreadyExists = await prismaUsersRepository.findByEmail(email)

  if (userAlreadyExists) {
    throw new Error('User already exists')
  }

  await prismaUsersRepository.create({
    name,
    email,
    password_hash,
  })
}
