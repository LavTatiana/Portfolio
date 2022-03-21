import requests

from token_name import token_name


class YaUploader:
    url = 'https://cloud-api.yandex.net/v1/disk/'

    def __init__(self, token: str):
        self.token = token

    def get_headers(self):
        return {
            'Content-Type': 'application/json',
            'Authorization': 'OAuth {}'.format(self.token)
        }

    def _get_upload_url(self, yandex_path: str):
        """Метод получает ссылку для загрузки файла на яндекс диск"""
        get_url = self.url + 'resources/upload'
        headers = self.get_headers()
        params = {'path': yandex_path, 'overwrite': True}
        response = requests.get(get_url, headers=headers, params=params)
        return response.json()['href']

    def upload(self, yandex_path: str, local_path: str):
        """Метод загруджает файл file_path на яндекс диск"""
        upload_url = self._get_upload_url(yandex_path)
        response = requests.put(upload_url, data=open(local_path, 'rb'))
        return response.status_code

    def create_folder(self, yandex_path: str):
        """Метод создает папку по пути yandex_path"""
        upload_url = self.url + 'resources/'
        headers = self.get_headers()
        params = {'path': yandex_path}
        response = requests.put(upload_url, headers=headers, params=params)
        return response.status_code


if __name__ == '__main__':
    uploader = YaUploader(token_name)
    result = uploader.create_folder('Cats')
    print(result)