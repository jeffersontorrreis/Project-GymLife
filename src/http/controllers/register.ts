import type { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'
import { registerUseCase } from '@/use-cases/register.js'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const registerBodySchema = z.object({
    email: z.string().email(),
    name: z.string(),
    password: z.string().min(6),
  })

  const { email, name, password } = registerBodySchema.parse(request.body)

  try {
    await registerUseCase({ name, email, password })
  } catch (_error) {
    return reply.status(409).send({ message: 'User already exists' })
  }

  return reply.status(201).send({ email, name })
}
