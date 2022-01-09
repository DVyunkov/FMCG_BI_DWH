# КХД (Корпоративное хранилище данных)
Корпоративное хранилище данных (DWH) для компании FMCG сектора.
<p>Детальное описание находится в Wiki: https://github.com/DVyunkov/FMCG_BI_DWH/wiki</p>

## Описание
Данный шаблон поможет быстро развернуть Корпоративное хранилище данных (DWH) на SQL сервере. Структура была разработана для компаний FMCG производства, но может успешно применятся и в других отраслях.

Шаблон состоит из нескольких проектов (баз данных), каждый проект содержит свой слой Хранилища:
- DP_DataLake (Озеро данных)
- DP_CDWH (Ядро хранилища)
- DP_DataMart (Аналитические витрины)
- DP_Staging (Интерфейсный и сервисные слои)

Данный подход (реализации каждого слоя в отдельной базе данных) позволяет гибко равертывать и управлять настройками. 
Например: 
- Data Lake будет содержать большое количество данных, большая часть которых будет использоватся редко. Такую базу дорого содержать в памяти и на высококскоростных дисках.
- DWH - наоборот, при правильном проектировани, небольшая база, но с высокой нагрузкой. Такую базу лучше разместить на высокоскоростных дисках.

Проекты созданы в Azure Data Studio, но могут быть использованы не только для Azure, но и на внутрикорпоративном MS SQL сервере. Для быстрого развертывания достаточно клонировать данные проекты, открыть в Azure Data Studio, как DATABASE PROJECT и подключиться к нужному серверу.

## Состав Корпоративного хранилища

-	Озеро данных (Data Lake) - проект DP_DataLake
-	Ядро хранилища DWH (Core Data Layer) - проект DP_CDWH
-	Аналитические витрины (Data Mart Layer) - проект DP_DataMart
-	Сервисный слой DWH (Service Layer) - проект DP_Staging
-	Интерфейсный слой (Interface Layer) - проект DP_Staging

## Схема Корпоративного хранилища
![Схема Корпоративного хранилища](https://github.com/DVyunkov/FMCG_BI_DWH/blob/main/Description/%D0%A1%D1%85%D0%B5%D0%BC%D0%B0%20CDWH.png "Схема")

## Озеро данных (Data Lake)
Слой хранилища, на котором выполняется загрузка информации из систем-источников (в исходном качестве и сохранением полной истории изменений). На этом слое происходит абстрагирование следующих слоев хранилища от физического устройства источников данных, способов их сбора и методов выделения изменений.

## Ядро хранилища DWH (Core Data Layer)
Центральный компонент, который выполняет консолидацию данных из разных источников, приводя их к единым структурам и ключам. Именно здесь происходит основная работа с качеством данных и общие трансформации, чтобы абстрагировать потребителей от особенностей логического устройства источников данных и необходимости их взаимного сопоставления. Так решается задача обеспечения целостности и качества данных.

## Аналитические витрины (Data Mart Layer)
Cлой DWH, где данные преобразуются к структурам, удобным для анализа и использования в OLAP кубах, BI-дэшбордах или других системах-потребителях. 
<p>Если же для быстрого решения локальных задач не нужна консолидация данных, витрина может брать первичные данные из операционного слоя, и называется соответственно операционной. Также бывают вторичные витрины, которые используются для представления результатов сложных расчетов и нетипичных трансформаций. Таким образом, витрины обеспечивают разные представления единых данных под конкретную бизнес-специфику.</p>
<p>Витрины данных могут состоять из предварительно рассчитанных таблиц, если извлечение данных требуется сложных и длительных запросов или из представлений на таблицы «Ядра хранилища».</p>

## Сервисный слой DWH (Service Layer)
Сервисный слой DWH (Service Layer) - слой DWH, который обеспечивает управление всеми вышеописанными уровнями. 
<p>Он не содержит бизнес-данных, но оперирует метаданными и другими структурами для работы с качеством данных, позволяя выполнять сквозной аудит данных (data lineage), использовать общие подходы к выделению дельты изменений и управления загрузкой. </p>
<p>Также здесь доступны средства мониторинга и диагностики ошибок, что ускоряет решение проблем.</p>

## Интерфейсный слой (Interface Layer)
Интерфейсный слой (Interface Layer) - слой DWH, который обеспечивает предоставление эталонных данных внешним системам. Данный слой используется для интеграций типа HUB. <p>Преимущество реализации централизованного обмена через DWH в предоставлении проверенных эталонных данных. Предлагается заменить интеграции типа Точка-Точка (локальные ПБД и таблицы) на данный централизованный подход.</p>
<p>Использование интерфейсного слоя, кроме классической интеграции, позволяет переслать в ИС недостающую или корректирующую информацию, по проблемам найденным вышеописанным средством мониторинга.</p>
