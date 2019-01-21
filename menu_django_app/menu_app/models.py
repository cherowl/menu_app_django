from django.db import models

class Menu(models.Model):
    title = models.CharField(max_length = 100, help_text="Enter menu title", null = False)
    
    # points_contained = models.

    def __init__(self, title):
        super(Menu, self).__init__()
        self.title = title

    def __str__(self):
        return self.title