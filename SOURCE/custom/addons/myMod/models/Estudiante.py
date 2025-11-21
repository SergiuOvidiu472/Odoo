from odoo import fields, models

class Estudiante(models.Model):
    _name = "estudiante"
    _description = "entidad estudiantes"

    name = fields.Char('Plan Name', required=True, translate=True)
    age = fields.Integer('# Age', requiered=True)
