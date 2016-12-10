from django.db import models

# Create your models here.


class HouseInfo(models.Model):
    location = models.CharField(max_length=200, null=True)
    estate = models.CharField(max_length=100, null=True)
    year = models.CharField(max_length=10, null=True)
    type = models.CharField(max_length=10, null=True)
    house_layout = models.CharField(max_length=50, null=True)
    house_area = models.CharField(max_length=50, null=True)
    direction = models.CharField(max_length=10, null=True)
    floor = models.CharField(max_length=16, null=True)
    decorate = models.CharField(max_length=20, null=True)
    unit_price = models.CharField(max_length=20, null=True)
    downpayment = models.CharField(max_length=20, null=True)
    month_pay = models.CharField(max_length=20, null=True)
