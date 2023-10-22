# Adding CI to Github

1. navigate to https://app.circleci.com/ and login

2. choose project and click `setup`

3. If you don't have .circleci/config.yml for your project, choose the following option, then click `Set Up Project`
```
Fastest: Use the .circleci/config.yml in my repo
```

### adding `markdown-link-check
> markdown-link-check
>
> Extracts links from markdown texts and checks whether each link is alive (200 OK) or dead.

```
1   version: 2.1
2
3   jobs:
4     markdown_link_check:
5       docker:
6         - image: cimg/node:15.11.0
7       steps:
8         - checkout
9         - run:
10            name: Install Markdown-Link-Check
11            command: sudo npm install -g markdown-link-check
12        - run:
13            name: Run Markdown-Link-Check
14            command: find . -name \*.md | xargs --max-lines=1 markdown-link-check
15
16   workflows:
17     workflow:
18       jobs:
19         - markdown_link_check
```
