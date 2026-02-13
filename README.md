1) установка терраформ

<img width="1472" height="629" alt="image" src="https://github.com/user-attachments/assets/8e180d27-56e9-4229-b1ec-bcae4f0f8d3e" />

скачал исходники terraform ,нужен был го , установил го , скачал архив го , обновил го , сбилдил терраформ ,занёс файл терраформ в /usr/local/bin/

2)

<img width="1484" height="336" alt="image" src="https://github.com/user-attachments/assets/69a715c8-ad34-4861-b6ed-1b8e2adcbea4" />

скачал дз , докер уже стоит

Задание1: дл

<img width="1493" height="722" alt="image" src="https://github.com/user-attachments/assets/23e89347-53bc-4e17-8cbe-fc6a5264ce94" />

скачал зависимости

<img width="761" height="320" alt="image" src="https://github.com/user-attachments/assets/9369f2af-714c-4fe2-9711-0ababf3a39f4" />

судя по содержимому файла gitignore логины,пароли,ключи,токены итд необходимо хранить в personal.auto.tfvars

<img width="1888" height="1100" alt="image" src="https://github.com/user-attachments/assets/bebcb5b3-872f-451f-b8df-0088ba8dd93f" />

выполнил код проекта

<img width="724" height="199" alt="image" src="https://github.com/user-attachments/assets/51f3c26a-97d5-4a66-8cae-a6cc112eb910" />

ресурс random_password выполнил свою задачу и выдал результат
"result": "zE2Avz0b0QSg1ZBF",

<img width="1391" height="453" alt="image" src="https://github.com/user-attachments/assets/be5cf468-b5aa-4d9d-a701-42fced14fdf4" />

раскоментировал и попробововал validate

<img width="1684" height="972" alt="image" src="https://github.com/user-attachments/assets/c68133e8-43c3-46ec-9371-e85f5c6fe2a0" />

исправил опечатку в названии контейнера , добавил имя nginx ресурсу docker_image, исправил название модуля random_string_fake для ресурса random_password, и исправил название самого модуля на 30 строчке

<img width="1617" height="880" alt="image" src="https://github.com/user-attachments/assets/ccf808ed-0b20-4acc-a592-2b23774570fe" />

теперь файл main.tf выглядит так

<img width="1761" height="114" alt="image" src="https://github.com/user-attachments/assets/eb145b90-6256-4d99-9109-aa7371faecca" />

код выполнен


