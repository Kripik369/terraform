1) установка терраформ

<img width="1472" height="629" alt="image" src="https://github.com/user-attachments/assets/8e180d27-56e9-4229-b1ec-bcae4f0f8d3e" />

скачал исходники terraform ,нужен был го , установил го , скачал архив го , обновил го , сбилдил терраформ ,занёс файл терраформ в /usr/local/bin/

2)

<img width="1484" height="336" alt="image" src="https://github.com/user-attachments/assets/69a715c8-ad34-4861-b6ed-1b8e2adcbea4" />

скачал дз , докер уже стоит

Задание1:

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

<img width="1502" height="104" alt="image" src="https://github.com/user-attachments/assets/398411e8-37ea-4ab9-acb6-eb8c3ba08e24" />

auto-aprove может быть опасен из за того что он подтверждает выполнение кода без вмешательства человека , однако это может быть полезно при автоматизации в пайплайне по той же причине

<img width="904" height="309" alt="image" src="https://github.com/user-attachments/assets/1875a305-e4f2-4213-9139-2415674c3fc2" />

ресурсы уничтожены , terraform destroy

<img width="569" height="125" alt="image" src="https://github.com/user-attachments/assets/e0fe6192-c6d2-4d77-9927-6ee10774c746" />

ответ на то почему не удалился образ nginx в коде а именно строчка keep_locally = true

<img width="1058" height="72" alt="image" src="https://github.com/user-attachments/assets/fe0b4f07-0526-4329-be45-21e64c6cf7a4" />

Задание№2

<img width="946" height="73" alt="image" src="https://github.com/user-attachments/assets/079ce07f-cf78-468e-8931-0980093629a1" />

создал вм и установил на ней docker 

<img width="1065" height="118" alt="image" src="https://github.com/user-attachments/assets/2b64d010-37ca-42c4-9cbd-2213334c5cf4" />

вот способ

<img width="1815" height="1080" alt="image" src="https://github.com/user-attachments/assets/f59cbfb4-354d-4327-bba0-3d4a9e89b5d9" />

вывод плана 

<img width="1879" height="1089" alt="image" src="https://github.com/user-attachments/assets/7ba96ce5-52db-4c99-a36b-92ad92386309" />

готово запустил на вм mysql:8

<img width="1919" height="1045" alt="image" src="https://github.com/user-attachments/assets/9b2dcc47-481a-481f-ada7-3a01f03f06a9" />
а вот переменные

задание 3

<img width="990" height="121" alt="image" src="https://github.com/user-attachments/assets/37718872-c13d-4417-8213-878c0c1eaa34" />

тофу установлен

увы запустить не удалось ,даже с изменением версии (1.15 пока не добралась до тофу) тк ресурс заблокирован в рф 

<img width="1897" height="479" alt="image" src="https://github.com/user-attachments/assets/c0b7a0bf-f358-4e20-ad16-2b2e48d3debf" />







а вот ответ из документации по данному вопросу




