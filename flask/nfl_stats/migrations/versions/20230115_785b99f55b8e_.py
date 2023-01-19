"""empty message

Revision ID: 785b99f55b8e
Revises: 8c38b8586b7c
Create Date: 2023-01-15 21:07:37.481820

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '785b99f55b8e'
down_revision = '8c38b8586b7c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('teams', sa.Column('division_id', sa.Integer(), nullable=False))
    op.add_column('teams', sa.Column('conference_id', sa.Integer(), nullable=False))
    op.create_foreign_key(None, 'teams', 'divisions', ['division_id'], ['id'])
    op.create_foreign_key(None, 'teams', 'conferences', ['conference_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'teams', type_='foreignkey')
    op.drop_constraint(None, 'teams', type_='foreignkey')
    op.drop_column('teams', 'conference_id')
    op.drop_column('teams', 'division_id')
    # ### end Alembic commands ###
