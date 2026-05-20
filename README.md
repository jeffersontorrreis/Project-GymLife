# GymLife app

## RFs
- [ ] Deve ser possível se cadastrar;
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível obter o perfil de um usuário logado;
- [ ] Deve ser possível obter o número de check-ins realizados pelo usuário logado;
- [ ] Deve ser possível obter o usuário obter seu histórico de check-ins;
- [ ] Deve ser possível o usuário buscar academias próximas;
- [ ] Deve ser possível o usuário buscar academias pelo nome;
- [ ] Deve ser possível o usuário realizar check-ins em uma academia;
- [ ] Deve ser possível validar o check-in de um usuário;
- [ ] Deve ser possível cadastrar uma academia;


## RNs
- [ ] O usuário não pode se cadastrar com e-mail duplicado;
- [ ] O usuário não pode realizar dois check-ins no mesmo dia;
- [ ] O usuário não pode fazer check-in se não estiver (100 m) da academia;
- [ ] O Tempo de expiração de check-in criado é de no máximo 20min;
- [ ] O check-in só pode ser validado por administradores;
- [ ] Só é possível registrar novas academias pelo administrador;



## RNFs
- [ ] A senha do usuário precisa ser criptografada;
- [ ] Os dados da aplicação precisam estar persistidos em um banco Postgres;
- [ ] Todas as listas de dados precisam estar paginadas com no máximo 20 itens por página;
- [ ] O usuário deve ser identificado por um JWT (JSON WEB TOKEN);

