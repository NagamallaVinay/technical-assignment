#Imports

import requests
from bs4 import BeautifulSoup
from urllib.parse import quote

# To Build the search URL using term entered by user.
def get_products(search_term):
    url = "https://mdcomputers.in/?route=product/search&search=" + quote(search_term)
    try:
        response = requests.get(
            url,
            headers={
                "User-Agent": "Mozilla/5.0"
            },
            timeout=10
        )
        response.raise_for_status()
    except requests.RequestException as e:
        print("Error while fetching the page:", e)
        return []
    # Parsing returned HTML 
    soup = BeautifulSoup(response.text, "html.parser")

    products = []

    for product in soup.select(".product-layout"):
        name = product.select_one(".name a")
        price = product.select_one(".price")

        if name and price:
            products.append((
                name.get_text(strip=True),
                price.get_text(" ", strip=True)
            ))

    return products


# SearchTerm from user (input)
search_term = input("Enter search term: ").strip()

if not search_term:
    print("Search term cannot be empty.")
else:
    # Search from website & display results.
    products = get_products(search_term)

    if not products:
        print("No products found.")
    else:
        print("\nProducts found:\n")

        for i, (name, price) in enumerate(products, 1):
            print(f"{i}. {name}")
            print(f"   Price: {price}")



#End
