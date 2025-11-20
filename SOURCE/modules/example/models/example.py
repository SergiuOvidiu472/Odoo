from odoo import models

class Example(models.Model):
    _name = 'first example'
    description='First model created'
    _sql_constrains =
    [
        ('name_not_null', 'CHECK(_name IS NOT NULL OR IS NOT "")', "You must provide a name")
    ]
