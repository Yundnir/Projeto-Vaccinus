	'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Usuario = sequelize.define('Usuario',{
		id: {
			field: 'idUsuario',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		nome: {
			field: 'nome',
			type: DataTypes.STRING,
			allowNull: false
		},
		email: {
			field: 'email',
			type: DataTypes.STRING,
			allowNull: false
		},
		Tel_Residencial: {
			field: 'Tel_Residencial',
			type: DataTypes.STRING,
			allowNull: false
		},
		Celular: {
			field: 'Celular',
			type: DataTypes.STRING,
			allowNull: false
		},
		CPF: {
			field: 'CPF',
			type: DataTypes.STRING,
			allowNull: false
		},
		senha: {
			field: 'senha',
			type: DataTypes.STRING,
			allowNull: false
		},
		fkEmpresa: {
			field: 'fkEmpresa',
			type: DataTypes.STRING,
			allowNull: false
		}
	}, 
	{
		tableName: 'tbUsuario', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Usuario;
};
