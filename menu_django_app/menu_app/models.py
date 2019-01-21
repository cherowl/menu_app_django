from django.db import models

class Menu(models.Model):
    title = models.CharField(max_length = 100, help_text="Enter menu title", null = False, db_index =True)
    
    # points_contained = models.

    @classmethod
    def create(cls, title):
        book = cls(title = title)
        return book

    def __str__(self):
        return self.title