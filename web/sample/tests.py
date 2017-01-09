from django.test import TestCase

# Create your tests here.
from django.test import TestCase
from sample.models import Person

class PersonTestCase(TestCase):
    def setUp(self):
        Person.objects.create(first_name="John", last_name="Doe")

    def test_person_names(self):
        john = Person.objects.get(first_name="John")
        self.assertEqual(john.last_name, 'Doe')