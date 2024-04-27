import string, random, unicodedata


def generate_random_string(length):
    # Chọn các ký tự từ chữ cái và chữ số
    characters = string.ascii_letters + string.digits
    # Sử dụng random.choice để chọn ngẫu nhiên các ký tự từ characters và tạo thành chuỗi
    random_string = ''.join(random.choice(characters) for _ in range(length))
    return random_string
def gerenate_username(firstname, lastname):
    firstname = unicodedata.normalize('NFKD', firstname).replace(' ', 'x')
    lastname = unicodedata.normalize('NFKD', lastname).replace(' ', 'x')
    username = firstname[0] + lastname[:3] + generate_random_string(5)
    return username.lower()

def get_value_choice(choice:list, value):
    for c in choice:
        if c[0].__eq__(value):
            return c[1]

    return None