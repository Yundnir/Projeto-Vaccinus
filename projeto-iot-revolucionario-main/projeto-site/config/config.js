module.exports = {
  production: {
    username: 'Vaccinus',
    password: '#Gfgrupo11',
    database: 'bd-grupo11',
    host: '202-1b-grupo11@bandtec.com.br',
    dialect: 'mssql',
    xuse_env_variable: 'DATABASE_URL',
    dialectOptions: {
      options: {
        encrypt: true
      }
    },
    pool: { 
      max: 5,
      min: 1,
      acquire: 5000,
      idle: 30000,
      connectTimeout: 5000
    }
  }
};
 
