# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170530181439) do

  create_table "NCBancos", primary_key: "BancoId", force: true do |t|
    t.string   "BancoNombre",            limit: 100, null: false
    t.string   "CuentaBancaria",         limit: 100, null: false
    t.integer  "DigitosCuentaBancaria",  limit: 2,   null: false
    t.integer  "DigitosCuentaAhorro",    limit: 2,   null: false
    t.integer  "DigitosCuentaCorriente", limit: 2,   null: false
    t.integer  "PaisId",                 limit: 8,   null: false
    t.boolean  "Activo",                             null: false
    t.integer  "UsuarioIdCreador",       limit: 8,   null: false
    t.datetime "FechaCreacion",          limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",        limit: 8,   null: false
    t.datetime "FechaUltMod",            limit: 23,  null: false
  end

  create_table "NCClientes", primary_key: "ClienteId", force: true do |t|
    t.integer  "SucursalId",       limit: 8,    null: false
    t.string   "Perfil",           limit: 1000, null: false
    t.string   "ClienteNombre",    limit: 250,  null: false
    t.boolean  "EsDirecto",                     null: false
    t.string   "Telefono1",        limit: 50,   null: false
    t.string   "Telefono2",        limit: 50,   null: false
    t.string   "Mail",             limit: 150,  null: false
    t.string   "PaginaWeb",        limit: 100,  null: false
    t.integer  "PaisId",           limit: 8,    null: false
    t.integer  "EstadoId",         limit: 8,    null: false
    t.boolean  "Activo",                        null: false
    t.integer  "UsuarioIdCreador", limit: 8,    null: false
    t.datetime "FechaCreacion",    limit: 23,   null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,    null: false
    t.datetime "FechaUltMod",      limit: 23,   null: false
  end

  create_table "NCClientesContactos", primary_key: "ClienteContactoId", force: true do |t|
    t.integer  "ClienteId",             limit: 8,   null: false
    t.string   "ClienteContactoNombre", limit: 150, null: false
    t.string   "Cargo",                 limit: 150, null: false
    t.string   "Mail",                  limit: 150, null: false
    t.string   "Telefono",              limit: 100, null: false
    t.string   "Celular",               limit: 100, null: false
    t.integer  "UsuarioIdCreador",      limit: 8,   null: false
    t.datetime "FechaCreacion",         limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",       limit: 8,   null: false
    t.datetime "FechaUltMod",           limit: 23,  null: false
  end

  create_table "NCConceptosGasto", primary_key: "ConceptoGastoId", force: true do |t|
    t.string   "ConceptoGastoNombre", limit: 100, null: false
    t.boolean  "Activo",                          null: false
    t.integer  "UsuarioIdCreador",    limit: 8,   null: false
    t.datetime "FechaCreacion",       limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",     limit: 8,   null: false
    t.datetime "FechaUltMod",         limit: 23,  null: false
  end

  create_table "NCContactos", primary_key: "ContactoId", force: true do |t|
    t.string   "ContactoNombre",        limit: 150,  null: false
    t.string   "Cargo",                 limit: 250,  null: false
    t.string   "Profesion",             limit: 100,  null: false
    t.string   "Mail",                  limit: 150,  null: false
    t.string   "Telefono",              limit: 100,  null: false
    t.string   "Celular",               limit: 100,  null: false
    t.string   "Genero",                limit: 2
    t.datetime "FechaCumpleanios",      limit: 23
    t.integer  "PaisId",                limit: 8,    null: false
    t.integer  "EstadoId",              limit: 8,    null: false
    t.integer  "MunicipioId",           limit: 8
    t.string   "Ciudad",                limit: 150,  null: false
    t.string   "Empresa",               limit: 150,  null: false
    t.integer  "SectorId",              limit: 8,    null: false
    t.integer  "SubSectorId",           limit: 8
    t.string   "Producto",                           null: false
    t.string   "EmpresaServicios",      limit: 2000, null: false
    t.integer  "EmpresaTamanio",        limit: 2
    t.integer  "EmpresaTotalEmpleados", limit: 4,    null: false
    t.string   "EmpresaPaginaWeb",      limit: 100,  null: false
    t.string   "Comentarios",           limit: 500,  null: false
    t.string   "AsistenteNombre",       limit: 150,  null: false
    t.string   "AsistenteMail",         limit: 50,   null: false
    t.string   "AsistenteTelefono",     limit: 50,   null: false
    t.string   "AsistenteCelular",      limit: 50,   null: false
    t.string   "Calle",                 limit: 150
    t.string   "NumeroExterior",        limit: 100
    t.string   "NumeroInterior",        limit: 100
    t.string   "Colonia",               limit: 150
    t.string   "CodigoPostal",          limit: 50
    t.boolean  "Activo",                             null: false
    t.integer  "UsuarioIdCreador",      limit: 8,    null: false
    t.datetime "FechaCreacion",         limit: 23,   null: false
    t.integer  "UsuarioIdUltMod",       limit: 8,    null: false
    t.datetime "FechaUltMod",           limit: 23,   null: false
  end

  create_table "NCContactosEstudiosMercado", primary_key: "ContactoEstudioMercadoId", force: true do |t|
    t.string   "ContactoNombre",              limit: 100, null: false
    t.string   "ContactoApellidoPaterno",     limit: 100, null: false
    t.string   "ContactoApellidoMaterno",     limit: 100, null: false
    t.string   "Telefono",                    limit: 50,  null: false
    t.string   "Extension",                   limit: 50,  null: false
    t.string   "Celular",                     limit: 50,  null: false
    t.string   "CelularViaRecarga",           limit: 50,  null: false
    t.string   "Mail",                        limit: 50,  null: false
    t.string   "MailPaypal",                  limit: 50,  null: false
    t.string   "CedulaProfesional",           limit: 50,  null: false
    t.integer  "PaisId",                      limit: 8,   null: false
    t.string   "Ciudad",                      limit: 100, null: false
    t.integer  "TargetId",                    limit: 8,   null: false
    t.string   "Especialidad",                limit: 150, null: false
    t.integer  "TipoHospital",                limit: 2,   null: false
    t.integer  "AniosPractica",               limit: 2,   null: false
    t.string   "Comentario",                  limit: 500, null: false
    t.string   "BeneficiarioNombre",          limit: 100, null: false
    t.string   "BeneficiarioApellidoPaterno", limit: 100, null: false
    t.string   "BeneficiarioApellidoMaterno", limit: 100, null: false
    t.integer  "BancoId",                     limit: 8
    t.string   "SucursalBanco",               limit: 50,  null: false
    t.string   "NumeroCuenta",                limit: 50,  null: false
    t.string   "Clabe",                       limit: 50,  null: false
    t.string   "Curp",                        limit: 50,  null: false
    t.string   "Rut",                         limit: 50,  null: false
    t.boolean  "Activo",                                  null: false
    t.integer  "UsuarioIdCreador",            limit: 8,   null: false
    t.datetime "FechaCreacion",               limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",             limit: 8,   null: false
    t.datetime "FechaUltMod",                 limit: 23,  null: false
  end

  create_table "NCFasesSubProyecto", primary_key: "FaseSubProyectoId", force: true do |t|
    t.integer  "TipoProyectoId",        limit: 8,   null: false
    t.string   "FaseSubProyectoNombre", limit: 100, null: false
    t.integer  "TipoCalculo",           limit: 2,   null: false
    t.boolean  "Activo",                            null: false
    t.integer  "UsuarioIdCreador",      limit: 8,   null: false
    t.datetime "FechaCreacion",         limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",       limit: 8,   null: false
    t.datetime "FechaUltMod",           limit: 23,  null: false
  end

  create_table "NCFormasPago", primary_key: "FormaPagoId", force: true do |t|
    t.string   "FormaPagoNombre",  limit: 100, null: false
    t.boolean  "Activo",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NCListaPrecios", primary_key: "PaisId", force: true do |t|
    t.integer  "TargetId",                    limit: 8,                           null: false
    t.integer  "ServicioId",                  limit: 8,                           null: false
    t.integer  "MetodologiaId",               limit: 8,                           null: false
    t.decimal  "PrecioUnitario",                         precision: 18, scale: 2, null: false
    t.string   "MonedaId",                    limit: 5,                           null: false
    t.decimal  "PorcentajeUtilidadMinimo",               precision: 18, scale: 4, null: false
    t.decimal  "PorcentajeUtilidadPropuesto",            precision: 8,  scale: 4, null: false
    t.integer  "UsuarioIdCreador",            limit: 8,                           null: false
    t.datetime "FechaCreacion",               limit: 23,                          null: false
    t.integer  "UsuarioIdUltMod",             limit: 8,                           null: false
    t.datetime "FechaUltMod",                 limit: 23,                          null: false
  end

  create_table "NCListaPreciosProveedores", primary_key: "ListaPrecioProveedorId", force: true do |t|
    t.integer  "PaisId",           limit: 8,                            null: false
    t.integer  "ServicioId",       limit: 8,                            null: false
    t.integer  "ProveedorId",      limit: 8,                            null: false
    t.integer  "TargetId",         limit: 8
    t.integer  "MetodologiaId",    limit: 8
    t.integer  "LOI",              limit: 2,                            null: false
    t.decimal  "PrecioUnitario",               precision: 18, scale: 2, null: false
    t.string   "MonedaId",         limit: 5,                            null: false
    t.string   "Observacion",      limit: 300,                          null: false
    t.integer  "UsuarioIdCreador", limit: 8,                            null: false
    t.datetime "FechaCreacion",    limit: 23,                           null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,                            null: false
    t.datetime "FechaUltMod",      limit: 23,                           null: false
  end

  create_table "NCMetodologias", primary_key: "MetodologiaId", force: true do |t|
    t.string   "MetodologiaNombre", limit: 150, null: false
    t.boolean  "Activo",                        null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "NCMonedas", primary_key: "MonedaId", force: true do |t|
    t.string   "MonedaNombre",     limit: 50, null: false
    t.boolean  "Activo",                      null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,  null: false
    t.datetime "FechaUltMod",      limit: 23, null: false
  end

  create_table "NCParametrosPais", primary_key: "PaisId", force: true do |t|
    t.string   "MonedaId",                limit: 5,  null: false
    t.boolean  "TieneNombreBeneficiario",            null: false
    t.boolean  "TieneBanco",                         null: false
    t.boolean  "TieneSucursalBanco",                 null: false
    t.boolean  "TieneNumeroCuenta",                  null: false
    t.boolean  "TieneClabe",                         null: false
    t.boolean  "TieneRut",                           null: false
    t.boolean  "TieneTipoCuenta",                    null: false
    t.boolean  "TieneCurp",                          null: false
    t.integer  "MinimoNumeroCuenta",      limit: 2,  null: false
    t.integer  "MinimoClabe",             limit: 2,  null: false
    t.integer  "MinimoRut",               limit: 2,  null: false
    t.integer  "MinimoCedulaProfesional", limit: 2,  null: false
    t.integer  "MaximoCedulaProfesional", limit: 2,  null: false
    t.integer  "MinimoTelefono",          limit: 2,  null: false
    t.integer  "MinimoCelular",           limit: 2,  null: false
    t.integer  "MinimoCurp",              limit: 2,  null: false
    t.integer  "UsuarioIdCreador",        limit: 8,  null: false
    t.datetime "FechaCreacion",           limit: 23, null: false
    t.integer  "UsuarioIdUltMod",         limit: 8,  null: false
    t.datetime "FechaUltMod",             limit: 23, null: false
  end

  create_table "NCPersonal", primary_key: "PersonalId", force: true do |t|
    t.string   "PersonalNombre",   limit: 150, null: false
    t.boolean  "EjecutivoCargo",               null: false
    t.boolean  "Consultor",                    null: false
    t.string   "Telefono",         limit: 50,  null: false
    t.string   "Celular",          limit: 50,  null: false
    t.string   "Mail",             limit: 150, null: false
    t.boolean  "Activo",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NCProveedores", primary_key: "ProveedorId", force: true do |t|
    t.string   "ProveedorNombre",   limit: 150, null: false
    t.string   "Rfc",               limit: 15,  null: false
    t.integer  "DiasEntrega",       limit: 4,   null: false
    t.integer  "CondicionPagoId",   limit: 8
    t.integer  "CuentaContableId",  limit: 8
    t.string   "PaginaWeb",         limit: 250, null: false
    t.string   "Calle",             limit: 150, null: false
    t.string   "NumeroExterno",     limit: 30,  null: false
    t.string   "NumeroInterno",     limit: 30,  null: false
    t.string   "Colonia",           limit: 150, null: false
    t.string   "CodigoPostal",      limit: 20,  null: false
    t.integer  "PaisId",            limit: 8
    t.integer  "EstadoId",          limit: 8
    t.integer  "MunicipioId",       limit: 8
    t.string   "ContactoNombre",    limit: 150, null: false
    t.string   "ContactoMail",      limit: 100, null: false
    t.string   "ContactoTelefono1", limit: 50,  null: false
    t.string   "ContactoTelefono2", limit: 50,  null: false
    t.boolean  "Activo",                        null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "NCSectores", primary_key: "SectorId", force: true do |t|
    t.string   "SectorNombre",     limit: 200, null: false
    t.string   "SectorDetalle",    limit: 500, null: false
    t.boolean  "Activo",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NCServicios", primary_key: "ServicioId", force: true do |t|
    t.string   "ServicioNombre",   limit: 150, null: false
    t.boolean  "Activo",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NCSubSectores", primary_key: "SubSectorId", force: true do |t|
    t.integer  "SectorId",         limit: 8,   null: false
    t.string   "SubSectorNombre",  limit: 200, null: false
    t.string   "Comentarios",      limit: 500, null: false
    t.boolean  "Activo",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NCTarget", primary_key: "TargetId", force: true do |t|
    t.string   "TargetNombre",               limit: 150, null: false
    t.boolean  "NecesarioCedulaProfesional",             null: false
    t.boolean  "NecesarioTipoHospital",                  null: false
    t.boolean  "NecesarioAniosPractica",                 null: false
    t.boolean  "Activo",                                 null: false
    t.integer  "UsuarioIdCreador",           limit: 8,   null: false
    t.datetime "FechaCreacion",              limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",            limit: 8,   null: false
    t.datetime "FechaUltMod",                limit: 23,  null: false
  end

  create_table "NCTiposCambio", primary_key: "FechaTipoCambio", force: true do |t|
    t.string   "MonedaIdOrigen",   limit: 5,                           null: false
    t.string   "MonedaIdDestino",  limit: 5,                           null: false
    t.decimal  "TipoCambio",                  precision: 18, scale: 6, null: false
    t.string   "Comentario",       limit: 10,                          null: false
    t.integer  "UsuarioIdCreador", limit: 8,                           null: false
    t.datetime "FechaCreacion",    limit: 23,                          null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,                           null: false
    t.datetime "FechaUltMod",      limit: 23,                          null: false
  end

  create_table "NCTiposCuentaBancaria", primary_key: "TipoCuentaBancariaId", force: true do |t|
    t.string   "TipoCuentaBancariaNombre", limit: 100, null: false
    t.boolean  "Activo",                               null: false
    t.integer  "UsuarioIdCreador",         limit: 8,   null: false
    t.datetime "FechaCreacion",            limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",          limit: 8,   null: false
    t.datetime "FechaUltMod",              limit: 23,  null: false
  end

  create_table "NCTiposDocumentoProveedor", primary_key: "TipoDocumentoProveedorId", force: true do |t|
    t.string   "TipoDocumentoClienteNombre", limit: 100, null: false
    t.boolean  "EsIngreso",                              null: false
    t.boolean  "Activo",                                 null: false
    t.integer  "UsuarioIdCreador",           limit: 8,   null: false
    t.datetime "FechaCreacion",              limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",            limit: 8,   null: false
    t.datetime "FechaUltMod",                limit: 23,  null: false
  end

  create_table "NCTiposEntregables", primary_key: "TipoEntregableId", force: true do |t|
    t.string   "TipoEntregableNombre", limit: 100, null: false
    t.boolean  "EsEntregableProyecto",             null: false
    t.boolean  "Activo",                           null: false
    t.integer  "UsuarioIdCreador",     limit: 8,   null: false
    t.datetime "FechaCreacion",        limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",      limit: 8,   null: false
    t.datetime "FechaUltMod",          limit: 23,  null: false
  end

  create_table "NCTiposProyecto", primary_key: "TipoProyectoId", force: true do |t|
    t.string   "TipoProyectoNombre", limit: 100, null: false
    t.boolean  "Activo",                         null: false
    t.integer  "UsuarioIdCreador",   limit: 8,   null: false
    t.datetime "FechaCreacion",      limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",    limit: 8,   null: false
    t.datetime "FechaUltMod",        limit: 23,  null: false
  end

  create_table "NTCotizacionesClientes", primary_key: "CotizacionClienteId", force: true do |t|
    t.integer  "SucursalId",        limit: 8,    null: false
    t.datetime "FechaCotizacion",   limit: 23,   null: false
    t.integer  "ClienteId",         limit: 8,    null: false
    t.string   "ReferenciaCliente", limit: 50,   null: false
    t.string   "MonedaId",          limit: 5,    null: false
    t.string   "Tema",              limit: 1000, null: false
    t.integer  "Estatus",           limit: 2,    null: false
    t.integer  "UsuarioIdCreador",  limit: 8,    null: false
    t.datetime "FechaCreacion",     limit: 23,   null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,    null: false
    t.datetime "FechaUltMod",       limit: 23,   null: false
  end

  create_table "NTCotizacionesClientesPaises", primary_key: "CotizacionClienteId", force: true do |t|
    t.integer  "PaisId",           limit: 8,  null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,  null: false
    t.datetime "FechaUltMod",      limit: 23, null: false
  end

  create_table "NTCotizacionesClientesTarget", primary_key: "CotizacionClienteTargetId", force: true do |t|
    t.integer  "CotizacionClienteId",   limit: 8,   null: false
    t.integer  "PaisId",                limit: 8,   null: false
    t.integer  "MetodologiaId",         limit: 8,   null: false
    t.integer  "TargetId",              limit: 8,   null: false
    t.string   "EspecificacionTarget",  limit: 200, null: false
    t.integer  "LOI",                   limit: 2,   null: false
    t.integer  "SampleSize",            limit: 2,   null: false
    t.integer  "IR",                    limit: 2,   null: false
    t.integer  "ProductividadEsperada", limit: 2,   null: false
    t.integer  "UsuarioIdCreador",      limit: 8,   null: false
    t.datetime "FechaCreacion",         limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",       limit: 8,   null: false
    t.datetime "FechaUltMod",           limit: 23,  null: false
  end

  create_table "NTCotizacionesClientesTargetServicios", primary_key: "CotizacionClienteTargetServicioId", force: true do |t|
    t.integer  "CotizacionClienteTargetId", limit: 8,                           null: false
    t.integer  "ServicioId",                limit: 8,                           null: false
    t.decimal  "Cantidad",                             precision: 18, scale: 2, null: false
    t.decimal  "PrecioUnitario",                       precision: 18, scale: 2, null: false
    t.decimal  "CostoUnitarioLocal",                   precision: 18, scale: 2, null: false
    t.string   "MonedaId",                  limit: 5,                           null: false
    t.integer  "UsuarioIdCreador",          limit: 8,                           null: false
    t.datetime "FechaCreacion",             limit: 23,                          null: false
    t.integer  "UsuarioIdUltMod",           limit: 8,                           null: false
    t.datetime "FechaUltMod",               limit: 23,                          null: false
  end

  create_table "NTEstadoCuentaProveedores", primary_key: "EstadoCuentaProveedorId", force: true do |t|
    t.integer  "SucursalId",                  limit: 8,                             null: false
    t.string   "TipoDocumentoProveedorId",    limit: 3,                             null: false
    t.datetime "FechaDocumento",              limit: 23,                            null: false
    t.string   "Documento",                   limit: 50,                            null: false
    t.integer  "ConceptoGastoId",             limit: 8,                             null: false
    t.integer  "ProveedorId",                 limit: 8
    t.integer  "ContactoEstudioMercadoId",    limit: 8
    t.integer  "ProyectoEstudioMercadoId",    limit: 8
    t.integer  "PersonalIdReclutador",        limit: 8
    t.integer  "PersonalIdEntrevistado",      limit: 8
    t.integer  "TargetId",                    limit: 8
    t.string   "MonedaId",                    limit: 5,                             null: false
    t.string   "MonedaIdEstandar",            limit: 5,                             null: false
    t.decimal  "ImportePrevio",                            precision: 18, scale: 2, null: false
    t.decimal  "ImporteMonedaOrigen",                      precision: 18, scale: 2, null: false
    t.decimal  "SaldoMonedaOrigen",                        precision: 18, scale: 2, null: false
    t.decimal  "TipoCambio",                               precision: 18, scale: 6, null: false
    t.integer  "FormaPagoId",                 limit: 8
    t.datetime "FechaVencimiento",            limit: 23
    t.integer  "Referencia",                  limit: 8
    t.string   "BeneficiarioNombre",          limit: 150,                           null: false
    t.string   "BeneficiarioApellidoPaterno", limit: 100,                           null: false
    t.string   "BeneficiarioApellidoMaterno", limit: 100,                           null: false
    t.integer  "BancoId",                     limit: 8
    t.string   "SucursalBanco",               limit: 50,                            null: false
    t.string   "NumeroCuenta",                limit: 50,                            null: false
    t.string   "Clabe",                       limit: 50,                            null: false
    t.string   "Rut",                         limit: 50,                            null: false
    t.integer  "TipoCuentaBancariaId",        limit: 8
    t.datetime "FechaFiltro",                 limit: 23
    t.datetime "FechaEntrevista",             limit: 23
    t.datetime "FechaEntrevistaReal",         limit: 23
    t.string   "ComentarioEntrevista",        limit: 500,                           null: false
    t.datetime "FechaCalidad",                limit: 23
    t.datetime "FechaValidado",               limit: 23
    t.integer  "EtiquetaLlamada",             limit: 2,                             null: false
    t.integer  "CalidadEntrevista",           limit: 2,                             null: false
    t.boolean  "Filtro",                                                            null: false
    t.string   "ComentariosFiltro",           limit: 500,                           null: false
    t.integer  "Duracion",                    limit: 2,                             null: false
    t.boolean  "Identidad",                                                         null: false
    t.string   "ComentariosIdentidad",        limit: 500,                           null: false
    t.boolean  "CalidadLlamada",                                                    null: false
    t.string   "ComentariosCalidadLlamada",   limit: 500,                           null: false
    t.string   "ComentarioPago",              limit: 500,                           null: false
    t.string   "ComentariosPorRevisar",       limit: 2000,                          null: false
    t.string   "ComentariosCancelado",        limit: 1000,                          null: false
    t.boolean  "IndicadorPorCalidad"
    t.integer  "PagoProveedorId",             limit: 8
    t.integer  "Estatus",                     limit: 2,                             null: false
    t.integer  "UsuarioIdCreador",            limit: 8,                             null: false
    t.datetime "FechaCreacion",               limit: 23,                            null: false
    t.integer  "UsuarioIdUltMod",             limit: 8,                             null: false
    t.datetime "FechaUltMod",                 limit: 23,                            null: false
  end

  create_table "NTPagosProveedores", primary_key: "PagoProveedorId", force: true do |t|
    t.string   "Descripcion",      limit: 200, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NTProyectos", primary_key: "ProyectoId", force: true do |t|
    t.string   "ProyectoNombre",       limit: 500, null: false
    t.integer  "TipoProyectoId",       limit: 8,   null: false
    t.string   "Detalle",              limit: 500, null: false
    t.integer  "ClienteId",            limit: 8,   null: false
    t.datetime "FechaRegistro",        limit: 23,  null: false
    t.datetime "FechaInicio",          limit: 23,  null: false
    t.datetime "FechaCierre",          limit: 23,  null: false
    t.datetime "FechaCierreNegociada", limit: 23
    t.integer  "PersonalIdEjecutivo",  limit: 8,   null: false
    t.integer  "SectorId",             limit: 8,   null: false
    t.integer  "SubSectorId",          limit: 8
    t.string   "Producto",                         null: false
    t.integer  "IdiomaFormato",        limit: 2,   null: false
    t.integer  "Estatus",              limit: 2,   null: false
    t.integer  "UsuarioIdCreador",     limit: 8,   null: false
    t.datetime "FechaCreacion",        limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",      limit: 8,   null: false
    t.datetime "FechaUltMod",          limit: 23,  null: false
  end

  create_table "NTProyectosEntregables", primary_key: "ProyectoEntregableId", force: true do |t|
    t.integer  "ProyectoId",                limit: 8,   null: false
    t.integer  "TipoEntregableId",          limit: 8,   null: false
    t.string   "ProyectoEntregableNombre",  limit: 150, null: false
    t.string   "ProyectoEntregableDetalle", limit: 500, null: false
    t.datetime "FechaEntrega",              limit: 23,  null: false
    t.datetime "FechaRealEntrega",          limit: 23
    t.integer  "UsuarioIdCreador",          limit: 8,   null: false
    t.datetime "FechaCreacion",             limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",           limit: 8,   null: false
    t.datetime "FechaUltMod",               limit: 23,  null: false
  end

  create_table "NTProyectosEspeciales", primary_key: "ProyectoEspecialId", force: true do |t|
    t.string   "ProyectoEspecialNombre", limit: 200, null: false
    t.integer  "ClienteId",              limit: 8,   null: false
    t.datetime "FechaAsignacion",        limit: 23,  null: false
    t.datetime "FechaInicio",            limit: 23,  null: false
    t.datetime "FechaEntrega",           limit: 23,  null: false
    t.integer  "PersonalIdEjecutivo",    limit: 8,   null: false
    t.integer  "Estatus",                limit: 2,   null: false
    t.integer  "UsuarioIdCreador",       limit: 8,   null: false
    t.datetime "FechaCreacion",          limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",        limit: 8,   null: false
    t.datetime "FechaUltMod",            limit: 23,  null: false
  end

  create_table "NTProyectosEspecialesActividades", primary_key: "ProyectoEspeciaEspecificacionId", force: true do |t|
    t.integer  "ActividadId",      limit: 8,  null: false
    t.integer  "ActividadNombre",  limit: 8,  null: false
    t.datetime "FechaPlaneada",    limit: 23, null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,  null: false
    t.datetime "FechaUltMod",      limit: 23, null: false
  end

  create_table "NTProyectosEspecialesEspecificaciones", primary_key: "ProyectoEspecialId", force: true do |t|
    t.integer  "ProyectoEspecialEspecificacionId",     limit: 8,   null: false
    t.string   "ProyectoEspecialEspecificacionNombre", limit: 500, null: false
    t.integer  "Cantidad",                             limit: 2,   null: false
    t.string   "Meta",                                 limit: 100, null: false
    t.string   "Target",                               limit: 100, null: false
    t.integer  "PaisId",                               limit: 8,   null: false
    t.integer  "UsuarioIdCreador",                     limit: 8,   null: false
    t.datetime "FechaCreacion",                        limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",                      limit: 8,   null: false
    t.datetime "FechaUltMod",                          limit: 23,  null: false
  end

  create_table "NTProyectosEstudiosMercado", primary_key: "ProyectoEstudioMercadoId", force: true do |t|
    t.integer  "ClienteId",         limit: 8,   null: false
    t.string   "Referencia",        limit: 100, null: false
    t.datetime "FechaInicio",       limit: 23,  null: false
    t.datetime "FechaEntrega",      limit: 23,  null: false
    t.integer  "CategoriaProyecto", limit: 2,   null: false
    t.integer  "Estatus",           limit: 2,   null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "NTSubProyectos", primary_key: "SubProyectoId", force: true do |t|
    t.integer  "ProyectoId",        limit: 8,    null: false
    t.string   "SubProyectoNombre", limit: 500,  null: false
    t.integer  "ClienteId",         limit: 8
    t.string   "ContactoNombre",    limit: 120,  null: false
    t.string   "ContactoTelefono",  limit: 50,   null: false
    t.string   "ContactoMail",      limit: 120,  null: false
    t.string   "Detalle",           limit: 500,  null: false
    t.string   "Objetivos",         limit: 2000, null: false
    t.integer  "CantidadObjetivo",  limit: 4,    null: false
    t.integer  "IdiomaFormato",     limit: 2,    null: false
    t.integer  "UsuarioIdCreador",  limit: 8,    null: false
    t.datetime "FechaCreacion",     limit: 23,   null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,    null: false
    t.datetime "FechaUltMod",       limit: 23,   null: false
  end

  create_table "NTSubProyectosAgenda", primary_key: "SubProyectoAgendaId", force: true do |t|
    t.integer  "SubProyectoId",    limit: 8,               null: false
    t.integer  "AgendaOrden",      limit: 2,               null: false
    t.integer  "ContactoId",       limit: 8
    t.string   "Instrucciones",    limit: 500,             null: false
    t.datetime "FechaCita",        limit: 23
    t.string   "LugarCita",        limit: 200,             null: false
    t.string   "LugarCita2",       limit: 200,             null: false
    t.string   "LugarCita3",       limit: 200,             null: false
    t.string   "LugarCita4",       limit: 200,             null: false
    t.string   "Descripcion",      limit: 500,             null: false
    t.integer  "UsuarioIdCreador", limit: 8,               null: false
    t.datetime "FechaCreacion",    limit: 23,              null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,               null: false
    t.datetime "FechaUltMod",      limit: 23,              null: false
    t.integer  "rating",           limit: 4,   default: 3
  end

  create_table "NTSubProyectosConsultores", primary_key: "SubProyectoId", force: true do |t|
    t.integer  "PersonalIdConsultor", limit: 8,   null: false
    t.string   "ActividadesRealizar", limit: 500, null: false
    t.integer  "UsuarioIdCreador",    limit: 8,   null: false
    t.datetime "FechaCreacion",       limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",     limit: 8,   null: false
    t.datetime "FechaUltMod",         limit: 23,  null: false
  end

  create_table "NTSubProyectosContactos", primary_key: "SubProyectoId", force: true do |t|
    t.integer  "ContactoId",          limit: 8,   null: false
    t.string   "NivelContacto",       limit: 2,   null: false
    t.datetime "FechaCita",           limit: 23
    t.string   "LugarCita",           limit: 200, null: false
    t.string   "LugarCita2",          limit: 200, null: false
    t.string   "LugarCita3",          limit: 200, null: false
    t.string   "LugarCita4",          limit: 200, null: false
    t.string   "ObservacionesRetro1", limit: 500, null: false
    t.string   "ObservacionesRetro2", limit: 500, null: false
    t.integer  "UsuarioIdCreador",    limit: 8,   null: false
    t.datetime "FechaCreacion",       limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",     limit: 8,   null: false
    t.datetime "FechaUltMod",         limit: 23,  null: false
  end

  create_table "NTSubProyectosEntregables", primary_key: "SubproyectoEntregableId", force: true do |t|
    t.integer  "SubProyectoId",                limit: 8,   null: false
    t.integer  "TipoEntregableId",             limit: 8,   null: false
    t.string   "SubproyectoEntregableNombre",  limit: 150, null: false
    t.string   "SubproyectoEntregableDetalle", limit: 500, null: false
    t.integer  "PersonalIdConsultor",          limit: 8,   null: false
    t.integer  "PersonalIdSupervisor",         limit: 8,   null: false
    t.datetime "FechaEntrega",                 limit: 23,  null: false
    t.datetime "FechaRealEntrega",             limit: 23
    t.integer  "UsuarioIdCreador",             limit: 8,   null: false
    t.datetime "FechaCreacion",                limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",              limit: 8,   null: false
    t.datetime "FechaUltMod",                  limit: 23,  null: false
  end

  create_table "NTSubProyectosEntregablesVersiones", primary_key: "EntregableId", force: true do |t|
    t.string   "Version",          limit: 100, null: false
    t.string   "Detalle",          limit: 500, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "NTSubProyectosFases", primary_key: "SubProyectoId", force: true do |t|
    t.integer  "FaseSubProyectoId", limit: 8,  null: false
    t.datetime "FechaPlaneada",     limit: 23
    t.integer  "CantidadPlaneada",  limit: 4,  null: false
    t.datetime "FechaReal",         limit: 23
    t.boolean  "FaseTerminada",                null: false
    t.integer  "UsuarioIdCreador",  limit: 8,  null: false
    t.datetime "FechaCreacion",     limit: 23, null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,  null: false
    t.datetime "FechaUltMod",       limit: 23, null: false
  end

  create_table "NUCotizacionPaises", id: false, force: true do |t|
    t.integer "UsuarioId", limit: 8, null: false
    t.integer "PaisId",    limit: 8, null: false
  end

  create_table "NUEstadoCuentaProveedores", id: false, force: true do |t|
    t.integer  "EstadoCuentaProveedorId", limit: 8,  null: false
    t.integer  "UsuarioId",               limit: 8,  null: false
    t.integer  "UsuarioIdCreador",        limit: 8,  null: false
    t.datetime "FechaCreacion",           limit: 23, null: false
    t.integer  "UsuarioIdUltMod",         limit: 8,  null: false
    t.datetime "FechaUltMod",             limit: 23, null: false
  end

  create_table "NUSubProyectosContactosXUsr", id: false, force: true do |t|
    t.integer  "UsuarioId",        limit: 8,  null: false
    t.integer  "ContactoId",       limit: 8,  null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,  null: false
    t.datetime "FechaUltMod",      limit: 23, null: false
  end

  create_table "PAEstados", primary_key: "EstadoId", force: true do |t|
    t.integer  "PaisId",           limit: 8,   null: false
    t.string   "EstadoNombre",     limit: 100, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAImpresoras", primary_key: "ImpresoraId", force: true do |t|
    t.integer  "SucursalId",       limit: 8,   null: false
    t.string   "ImpresoraNombre",  limit: 200, null: false
    t.string   "Descripcion",      limit: 100, null: false
    t.integer  "Tipo",             limit: 3,   null: false
    t.boolean  "Activa",                       null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAImpresorasXUsuario", primary_key: "UsuarioId", force: true do |t|
    t.integer  "ImpresoraId",      limit: 8,  null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
  end

  create_table "PAMenus", primary_key: "MenuId", force: true do |t|
    t.string "Descripcion", limit: 100, null: false
  end

  create_table "PAMunicipios", primary_key: "MunicipioId", force: true do |t|
    t.integer  "EstadoId",         limit: 8,   null: false
    t.string   "MunicipioNombre",  limit: 100, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAOpcionesXMenu", primary_key: "OpcionMenuId", force: true do |t|
    t.integer  "MenuId",           limit: 3,   null: false
    t.string   "Jerarquia",        limit: 400, null: false
    t.integer  "Orden",            limit: 4,   null: false
    t.string   "OpcionMenuNombre", limit: 50,  null: false
    t.string   "Descripcion",      limit: 200, null: false
    t.string   "Url",              limit: 200, null: false
    t.string   "Parametros",       limit: 200, null: false
    t.boolean  "EsPermanente",                 null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAPaises", primary_key: "PaisId", force: true do |t|
    t.string   "PaisNombre",       limit: 100, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAParametrosSistema", id: false, force: true do |t|
    t.integer  "SucursalId",       limit: 8
    t.integer  "TipoSucursalId",   limit: 4
    t.string   "ParametroId",      limit: 30,  null: false
    t.string   "Valor",            limit: 50,  null: false
    t.integer  "TipoValor",        limit: 3,   null: false
    t.string   "Descripcion",      limit: 250, null: false
    t.boolean  "Publico",                      null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PAServidoresCorreo", primary_key: "ServidorCorreoId", force: true do |t|
    t.string   "Servidor",          limit: 250, null: false
    t.integer  "Puerto",            limit: 4,   null: false
    t.boolean  "SslActivo",                     null: false
    t.string   "EmisorCorreo",      limit: 250, null: false
    t.string   "EmisorContrasenia", limit: 250, null: false
    t.string   "EmisorNombre",      limit: 200, null: false
    t.boolean  "Activo",                        null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "PAServidoresCorreoUsuarios", primary_key: "ServidorCorreoId", force: true do |t|
    t.integer  "UsuarioId",         limit: 8,   null: false
    t.string   "EmisorCorreo",      limit: 250, null: false
    t.string   "EmisorContrasenia", limit: 250, null: false
    t.string   "EmisorNombre",      limit: 200, null: false
    t.boolean  "Activo",                        null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "PASucursales", primary_key: "SucursalId", force: true do |t|
    t.string   "Jerarquia",            limit: 400, null: false
    t.integer  "TipoSucursalId",       limit: 4,   null: false
    t.string   "RazonSocial",          limit: 250, null: false
    t.string   "NombreComercial",      limit: 250, null: false
    t.string   "Rfc",                  limit: 20,  null: false
    t.string   "Curp",                 limit: 20,  null: false
    t.string   "FiscalCalle",          limit: 200, null: false
    t.string   "FiscalNumeroExterior", limit: 25,  null: false
    t.string   "FiscalNumeroInterior", limit: 25,  null: false
    t.string   "FiscalColonia",        limit: 100, null: false
    t.string   "FiscalCodigoPostal",   limit: 20,  null: false
    t.string   "FiscalMunicipio",      limit: 100, null: false
    t.string   "FiscalEstado",         limit: 100, null: false
    t.string   "FiscalPais",           limit: 100, null: false
    t.string   "Telefonos",            limit: 100, null: false
    t.string   "Fax",                  limit: 50,  null: false
    t.string   "PaginaWeb",            limit: 250, null: false
    t.string   "CorreoElectronico",    limit: 100, null: false
    t.integer  "UsuarioIdCreador",     limit: 8,   null: false
    t.datetime "FechaCreacion",        limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",      limit: 8,   null: false
    t.datetime "FechaUltMod",          limit: 23,  null: false
  end

  create_table "PATiposSucursales", primary_key: "TipoSucursalId", force: true do |t|
    t.string   "TipoSucursalNombre", limit: 100, null: false
    t.integer  "UsuarioIdCreador",   limit: 8,   null: false
    t.datetime "FechaCreacion",      limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",    limit: 8,   null: false
    t.datetime "FechaUltMod",        limit: 23,  null: false
  end

  create_table "PSAuditoriaAccionesDet", primary_key: "AuditoriaAccionDetId", force: true do |t|
    t.integer "AuditoriaAccionId", limit: 8,   null: false
    t.string  "CampoDatos",        limit: 250
    t.string  "QueryDetalle",      limit: 250
  end

  create_table "PSAuditoriaAccionesEnc", primary_key: "AuditoriaAccionId", force: true do |t|
    t.integer  "SucursalId",          limit: 8,  null: false
    t.integer  "UsuarioIdSolicito",   limit: 8,  null: false
    t.integer  "UsuarioIdAutorizo",   limit: 8,  null: false
    t.integer  "PermisoIdAutorizado", limit: 8,  null: false
    t.datetime "Fecha",               limit: 23, null: false
  end

  create_table "PSGrupos", primary_key: "GrupoId", force: true do |t|
    t.string   "Jerarquia",        limit: 400, null: false
    t.string   "GrupoNombre",      limit: 100, null: false
    t.string   "Descripcion",      limit: 300, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PSNivelesConsultaXSucursal", primary_key: "NivelConsultaXSucursalId", force: true do |t|
    t.string "NivelConsultaXSucursalNombre", limit: 200, null: false
  end

  create_table "PSParametrosXPerfil", primary_key: "ParametroXPerfilId", force: true do |t|
    t.integer  "TipoValor",        limit: 3,   null: false
    t.string   "Descripcion",      limit: 250, null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PSParametrosXPerfilValores", primary_key: "ParametroXPerfilId", force: true do |t|
    t.integer  "PerfilId",         limit: 8,  null: false
    t.string   "Valor",            limit: 50, null: false
    t.integer  "UsuarioIdCreador", limit: 8,  null: false
    t.datetime "FechaCreacion",    limit: 23, null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,  null: false
    t.datetime "FechaUltMod",      limit: 23, null: false
  end

  create_table "PSPerfiles", primary_key: "PerfilId", force: true do |t|
    t.string   "PerfilNombre",        limit: 100, null: false
    t.string   "Descripcion",         limit: 300, null: false
    t.integer  "OpcionMenuIdDefault", limit: 8
    t.integer  "NivelAccesoXIP",      limit: 3,   null: false
    t.integer  "UsuarioIdCreador",    limit: 8,   null: false
    t.datetime "FechaCreacion",       limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",     limit: 8,   null: false
    t.datetime "FechaUltMod",         limit: 23,  null: false
  end

  create_table "PSPermisos", primary_key: "PermisoId", force: true do |t|
    t.string   "Jerarquia",            limit: 400, null: false
    t.string   "PermisoNombre",        limit: 100, null: false
    t.string   "Descripcion",          limit: 300, null: false
    t.integer  "OpcionMenuId",         limit: 8
    t.string   "Accion",               limit: 60,  null: false
    t.boolean  "EsConsultaControlada",             null: false
    t.boolean  "Auditar",                          null: false
    t.string   "AudicionQuery",        limit: 100
    t.string   "AudicionFormatoDatos", limit: 100
    t.boolean  "Activo",                           null: false
    t.integer  "UsuarioIdCreador",     limit: 8,   null: false
    t.datetime "FechaCreacion",        limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",      limit: 8,   null: false
    t.datetime "FechaUltMod",          limit: 23,  null: false
  end

  create_table "PSPermisosXPerfil", primary_key: "PerfilId", force: true do |t|
    t.integer  "PermisoId",                limit: 8,  null: false
    t.boolean  "RequiereAutorizacion",                null: false
    t.boolean  "PuedeAutorizar",                      null: false
    t.integer  "NivelConsultaXSucursalId", limit: 4,  null: false
    t.integer  "TipoAudicion",             limit: 3,  null: false
    t.integer  "UsuarioIdCreador",         limit: 8,  null: false
    t.datetime "FechaCreacion",            limit: 23, null: false
    t.integer  "UsuarioIdUltMod",          limit: 8,  null: false
    t.datetime "FechaUltMod",              limit: 23, null: false
  end

  create_table "PSPoliticasClaves", id: false, force: true do |t|
    t.integer  "UsuarioId",         limit: 8
    t.integer  "PerfilId",          limit: 8
    t.boolean  "EsContrasenia",                null: false
    t.boolean  "PuedeCambiarClave",            null: false
    t.integer  "DiasCaduca",        limit: 4,  null: false
    t.integer  "LongitudMinima",    limit: 4,  null: false
    t.integer  "LetrasMinimo",      limit: 4,  null: false
    t.integer  "NumerosMinimo",     limit: 4,  null: false
    t.integer  "OtrosMinimo",       limit: 4,  null: false
    t.integer  "UsuarioIdCreador",  limit: 8,  null: false
    t.datetime "FechaCreacion",     limit: 23, null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,  null: false
    t.datetime "FechaUltMod",       limit: 23, null: false
  end

  create_table "PSUsuarios", primary_key: "UsuarioId", force: true do |t|
    t.integer  "SucursalId",                    limit: 8,   null: false
    t.string   "Usuario",                       limit: 50,  null: false
    t.string   "Contrasenia",                   limit: 50,  null: false
    t.string   "ClaveAutorizacion",             limit: 50,  null: false
    t.string   "Nombre",                        limit: 50,  null: false
    t.string   "ApellidoPaterno",               limit: 50,  null: false
    t.string   "ApellidoMaterno",               limit: 50,  null: false
    t.string   "CorreoElectronico",             limit: 100, null: false
    t.boolean  "Activo",                                    null: false
    t.integer  "PerfilId",                      limit: 8,   null: false
    t.integer  "GrupoId",                       limit: 8,   null: false
    t.datetime "FecUltCambioContrasenia",       limit: 23,  null: false
    t.datetime "FecUltCambioClaveAutorizacion", limit: 23,  null: false
    t.integer  "UsuarioIdCreador",              limit: 8,   null: false
    t.datetime "FechaCreacion",                 limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",               limit: 8,   null: false
    t.datetime "FechaUltMod",                   limit: 23,  null: false
  end

  create_table "PUSelColColumnas", primary_key: "SelectorColumnaId", force: true do |t|
    t.string "ColumnaNombre",   limit: 100, null: false
    t.string "ColumnaEtiqueta", limit: 100, null: false
  end

  create_table "PUSelColColumnasXGrupos", primary_key: "SelectorColumnaId", force: true do |t|
    t.string  "GrupoId",       limit: 30,  null: false
    t.string  "ColumnaNombre", limit: 100, null: false
    t.integer "Orden",         limit: 4,   null: false
  end

  create_table "PUSelColEnc", primary_key: "SelectorColumnaId", force: true do |t|
  end

  create_table "PUSelColGrupos", primary_key: "SelectorColumnaId", force: true do |t|
    t.string   "GrupoId",          limit: 30,  null: false
    t.string   "GrupoNombre",      limit: 100, null: false
    t.integer  "Orden",            limit: 4,   null: false
    t.integer  "UsuarioIdCreador", limit: 8,   null: false
    t.datetime "FechaCreacion",    limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",  limit: 8,   null: false
    t.datetime "FechaUltMod",      limit: 23,  null: false
  end

  create_table "PUTablerosControl", primary_key: "TableroControlId", force: true do |t|
    t.integer  "TableroControlModuloId", limit: 4,   null: false
    t.integer  "OrdenMenu",              limit: 4,   null: false
    t.string   "OpcionNombre",           limit: 60,  null: false
    t.string   "Titulo",                 limit: 300, null: false
    t.boolean  "Activo",                             null: false
    t.integer  "UsuarioIdCreador",       limit: 8,   null: false
    t.datetime "FechaCreacion",          limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",        limit: 8,   null: false
    t.datetime "FechaUltMod",            limit: 23,  null: false
  end

  create_table "PUTablerosControlConsultas", primary_key: "TableroControlId", force: true do |t|
    t.integer  "TableroControlConsultaId", limit: 8,    null: false
    t.string   "Titulo",                   limit: 300,  null: false
    t.integer  "Orden",                    limit: 4,    null: false
    t.string   "Query",                    limit: 8000, null: false
    t.string   "QueryDefiniciones",                     null: false
    t.string   "ColumnaOrdenDefault",      limit: 60,   null: false
    t.integer  "Accion",                   limit: 3,    null: false
    t.integer  "TipoGraficaDefault",       limit: 2,    null: false
    t.integer  "AnchoGrafica",             limit: 4,    null: false
    t.integer  "AltoGrafica",              limit: 4,    null: false
    t.string   "EtiquetaSeries",           limit: 100,  null: false
    t.boolean  "Activo",                                null: false
    t.integer  "UsuarioIdCreador",         limit: 8,    null: false
    t.datetime "FechaCreacion",            limit: 23,   null: false
    t.integer  "UsuarioIdUltMod",          limit: 8,    null: false
    t.datetime "FechaUltMod",              limit: 23,   null: false
  end

  create_table "PUTablerosControlModulos", primary_key: "TableroControlModuloId", force: true do |t|
    t.string   "TableroControlModuloNombre", limit: 60, null: false
    t.integer  "Orden",                      limit: 4,  null: false
    t.integer  "UsuarioIdCreador",           limit: 8,  null: false
    t.datetime "FechaCreacion",              limit: 23, null: false
    t.integer  "UsuarioIdUltMod",            limit: 8,  null: false
    t.datetime "FechaUltMod",                limit: 23, null: false
  end

  create_table "PUTablerosControlPermisos", primary_key: "TableroControlId", force: true do |t|
    t.integer  "PerfilId",                 limit: 8,  null: false
    t.integer  "NivelConsultaXSucursalId", limit: 4,  null: false
    t.integer  "UsuarioIdCreador",         limit: 8,  null: false
    t.datetime "FechaCreacion",            limit: 23, null: false
    t.integer  "UsuarioIdUltMod",          limit: 8,  null: false
    t.datetime "FechaUltMod",              limit: 23, null: false
  end

  create_table "PUTiposDocumentos", primary_key: "TipoFuncionId", force: true do |t|
    t.integer  "TipoDocumentoId",     limit: 4,   null: false
    t.string   "TipoDocumentoNombre", limit: 150, null: false
    t.integer  "UsuarioIdCreador",    limit: 8,   null: false
    t.datetime "FechaCreacion",       limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",     limit: 8,   null: false
    t.datetime "FechaUltMod",         limit: 23,  null: false
  end

  create_table "PUTiposFunciones", primary_key: "TipoFuncionId", force: true do |t|
    t.string   "TipoFuncionNombre", limit: 150, null: false
    t.integer  "UsuarioIdCreador",  limit: 8,   null: false
    t.datetime "FechaCreacion",     limit: 23,  null: false
    t.integer  "UsuarioIdUltMod",   limit: 8,   null: false
    t.datetime "FechaUltMod",       limit: 23,  null: false
  end

  create_table "admin_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "salt"
    t.string   "password"
    t.datetime "created_at", limit: 23
    t.datetime "updated_at", limit: 23
  end

  create_table "comments", force: true do |t|
    t.text     "coment_text"
    t.datetime "created_at",                limit: 23
    t.datetime "updated_at",                limit: 23
    t.string   "attachment"
    t.integer  "ntsub_proyectos_agenda_id", limit: 4
    t.integer  "user_app_id",               limit: 4
  end

  create_table "devices", force: true do |t|
    t.integer  "user_app_id", limit: 4
    t.string   "device"
    t.string   "system"
    t.string   "serialx"
    t.datetime "created_at",  limit: 23
    t.datetime "updated_at",  limit: 23
  end

  create_table "images", force: true do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id",   limit: 4
    t.integer  "user_app",       limit: 4
    t.string   "file"
    t.datetime "created_at",     limit: 23
    t.datetime "updated_at",     limit: 23
  end

  create_table "notes", force: true do |t|
    t.string   "notable_type"
    t.string   "notable_id"
    t.text     "note"
    t.datetime "created_at",   limit: 23
    t.datetime "updated_at",   limit: 23
  end

  create_table "rails_push_notifications_apns_apps", force: true do |t|
    t.text     "apns_dev_cert"
    t.text     "apns_prod_cert"
    t.boolean  "sandbox_mode"
    t.datetime "created_at",     limit: 23, null: false
    t.datetime "updated_at",     limit: 23, null: false
  end

  create_table "rails_push_notifications_gcm_apps", force: true do |t|
    t.string   "gcm_key"
    t.datetime "created_at", limit: 23, null: false
    t.datetime "updated_at", limit: 23, null: false
  end

  create_table "rails_push_notifications_mpns_apps", force: true do |t|
    t.text     "cert"
    t.datetime "created_at", limit: 23, null: false
    t.datetime "updated_at", limit: 23, null: false
  end

  create_table "rpush_apps", force: true do |t|
    t.string   "name",                                           null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             limit: 4,  default: 1, null: false
    t.datetime "created_at",              limit: 23
    t.datetime "updated_at",              limit: 23
    t.string   "type",                                           null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration", limit: 23
  end

  create_table "rpush_feedback", force: true do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",    limit: 23, null: false
    t.datetime "created_at",   limit: 23
    t.datetime "updated_at",   limit: 23
    t.integer  "app_id",       limit: 4
  end

  add_index "rpush_feedback", ["device_token"], name: "index_rapns_feedback_on_device_token"

  create_table "rpush_notifications", force: true do |t|
    t.integer  "badge",             limit: 4
    t.string   "device_token",      limit: 64
    t.string   "sound",                        default: "default"
    t.text     "alert"
    t.text     "data"
    t.integer  "expiry",            limit: 4,  default: 86400
    t.boolean  "delivered",                    default: false,     null: false
    t.datetime "delivered_at",      limit: 23
    t.boolean  "failed",                       default: false,     null: false
    t.datetime "failed_at",         limit: 23
    t.integer  "error_code",        limit: 4
    t.text     "error_description"
    t.datetime "deliver_after",     limit: 23
    t.datetime "created_at",        limit: 23
    t.datetime "updated_at",        limit: 23
    t.boolean  "alert_is_json",                default: false
    t.string   "type",                                             null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",             default: false,     null: false
    t.text     "registration_ids"
    t.integer  "app_id",            limit: 4,                      null: false
    t.integer  "retries",           limit: 4,  default: 0
    t.string   "uri"
    t.datetime "fail_after",        limit: 23
    t.boolean  "processing",                   default: false,     null: false
    t.integer  "priority",          limit: 4
    t.text     "url_args"
    t.string   "category"
    t.boolean  "content_available",            default: false
    t.text     "notification"
  end

  add_index "rpush_notifications", ["app_id", "delivered", "failed", "deliver_after"], name: "index_rapns_notifications_multi"
  add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi"

# Could not dump table "sysdiagrams" because of following StandardError
#   Unknown type 'sysname(128)' for column 'name'

  create_table "user_apps", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "linkedin"
    t.string   "barcode_presentation_card"
    t.string   "presentation_card_front"
    t.string   "presentation_card_behind"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at",                limit: 23
    t.datetime "updated_at",                limit: 23
    t.string   "avatar"
    t.string   "bussines_avatar"
    t.string   "email"
    t.text     "accounts_array"
    t.boolean  "have_users_extra_accounts",            default: false
  end

end
