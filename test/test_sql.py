from unittest import TestCase

from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError

from sqlalchemy.ext.declarative import declarative_base

from time import sleep

from sqlalchemy import Column, Integer, String

Base = declarative_base()


class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    fullname = Column(String)
    password = Column(String)


class TestSQL(TestCase):
    def test_create(self):
        engine = create_engine('sqlite:///:memory:', echo=True)
        Base.metadata.create_all(engine)

        from sqlalchemy.orm import sessionmaker
        session = sessionmaker(bind=engine)()

        user = User(name="Peter", fullname="Peter Maffay")
        session.add(user)
        session.commit()

        x = session.query(User).filter_by(name="Peter").one()
        self.assertIsNotNone(x)

    def test_server(self):
        awake = False
        while not awake:
            try:
                engine = create_engine("postgresql+psycopg2://postgres:test@test-postgresql/postgres")
                conn = engine.connect()
                conn.execute("commit")
                awake = True
            except OperationalError:
                sleep(1)

        # drop all tables (and therefore all content if there is any...)
        Base.metadata.drop_all(engine)

        # recreate all tables...
        Base.metadata.create_all(engine)

        from sqlalchemy.orm import sessionmaker
        session = sessionmaker(bind=engine)()

        user = User(name="Peter", fullname="Peter Maffay")
        session.add(user)
        session.commit()

        x = session.query(User).filter_by(name="Peter").one()
        self.assertIsNotNone(x)
