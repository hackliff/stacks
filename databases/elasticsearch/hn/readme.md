# [Index and search Hacker News](https://github.com/oliver006/elasticsearch-hn)

## Data initialisation

Assuming `docker` and `docker-compose` are installed, just `(cd .. &&
docker-compose up -d)`.

Check if everything went fine with `curl localhost:9200`.

Scrape Hacker news and upload the data in *elasticsearch*: `python
update.py` (run `pip install requests` before).

And query: `curl "http://localhost:9200/hn/story/_search?q=score:57&pretty"`
