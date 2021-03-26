# Template

This website uses the jekyll minimal mistakes template. Open the repo to find out how the website ought to be structured, or go on the website it creates to see what it should look like.

Most items are documented in "sample posts", so you can view how to modify a figure gallery, add a sidebar, an author etc.

repo: https://github.com/mmistakes/minimal-mistakes
website: https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/

## Figures

Datawrapper is a rapid interactive way to make figures 
https://app.datawrapper.de/edit/OEM92/publish

D3 js gallery


## Website links

- new website: https://eeci.github.io/home/ 
- old website: https://www.eeci.cam.ac.uk/


# Getting started

## Adding an author

- Add yourself to _data/authors.yml: to create an author avatar which you can sign off posts you write
- Add yourself to docs/our-team in the gallery to have a profile on the main page
- Create a long page for yourself in docs/people/yourname.md, where you can add a bibliography, publications etc
- Link yourself in the navigation in _data/navigation.yml

## Adding a project

Projects are stored in docs folder, and the navigation of docs is defined in _data/navigation.yml

- Decide if you want your project to be a post or a long-term part of your project page
- Same as for your personal page, add a photo in the project gallery, create your page, and link to it in navigation
- You may want to create a new subfolder in docs if there are many pages
- You can add sub menus called child pages

## Adding a post

Posts are stored in _posts folder. The file name must start with date in this format YYYY-MM-DD-blogpostname. This will allow the most recent posts to always appear on the homepages. 

# Repo organisation

This section explains the repo organisation:

* _layouts: contains file layouts
* _includes: contains the little bits that are included in the layouts such as headers and footers
* _pages: static pages which are accessible from menu bar, but also those that don't fit in any category such as our bespoke error page
* _posts: news stories
* _docs: documents sorted in folders, mainly our people and projects pages
* Images: where we store the images for the main pages
* assets: contains formatting css pics and logo in a separate image folder

# Resources

- A [nice guide] (https://www.markdownguide.org/basic-syntax/) for markdown syntax
