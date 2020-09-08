#David Horikawa da Silva
#!/usr/bin/env python
# coding: utf-8

# In[16]:


import requests
import json
import io


# In[17]:


for i in (587496,664297,531499,659991,521034,517412,581392,625568,523781,501979,340102,520318,500840,577922,701354,659986,653578,603206,713239,245842,531033,616251,525910,583760,735580,615115,479259,536396,729779,403864,659125,730647,541305,635780,586101,492414,539885,559401,524047,567965):
    f= io.open("movie_credits", "a", encoding="utf-8")
    response = requests.get('https://api.themoviedb.org/3/movie/'+str(i)+'/credits?api_key=f798d4b67ef8062d2437df2179fcb6a4')
    j=str(response.json())
    f.write(j)
f.close()

