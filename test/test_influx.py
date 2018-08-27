from unittest import TestCase

from influxdb import InfluxDBClient


class TestInfluxDB(TestCase):
    @classmethod
    def setUpClass(cls):
        cls.client = InfluxDBClient(host='test-influxdb')
        cls.client.create_database("testexample")

    @classmethod
    def tearDownClass(cls):
        cls.client.close()

    def test_client(self):
        databases = set([database["name"] for database in self.client.get_list_database()])
        self.assertTrue("testexample" in databases)


