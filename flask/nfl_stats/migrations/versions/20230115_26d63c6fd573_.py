"""empty message

Revision ID: 26d63c6fd573
Revises: 785b99f55b8e
Create Date: 2023-01-15 21:51:25.819893

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '26d63c6fd573'
down_revision = '785b99f55b8e'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('conferences', sa.Column('abbreviation', sa.String(length=3), nullable=False))
    op.create_unique_constraint(None, 'conferences', ['abbreviation'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'conferences', type_='unique')
    op.drop_column('conferences', 'abbreviation')
    # ### end Alembic commands ###
