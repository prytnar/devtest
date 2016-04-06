Code review - wartosciowe uwagi:
- nazewnictwo metod ktore dostarczaja strong params nie odpowiada akcja, w których są używane , co powoduje coupling pomiędzy akcjami i fanout effect
- w kontrolerze PricingController w akcji evaluate_target walidowany jest kalculator co nie ma sensu, ponieważ nie waliduje się kalkulatora per se , tylko dane wchodzące do kalkulatora, co lamie tutaj single responsibility
- w Pricing::Calculator metoda "to_json" wykonuje dwie czynnosci: buduje json representation i wykonuje pośrednia kalkulacje cen, co lamie zasadę single responsibility
- w Pricing::Calculator metoda "initialize" wykonuje konwersje parametrow ":locations" na model bezpośrednio w swojej definicji co jest złym pomysłem z kilku powodów:
-- tego typu obrobka danych nie jest odpowiedzialności kalkulatora, ponieważ kalkulator powinien operować na już obrobionych prostych danych. (SRP)
-- używanie modeli aplikacji w modułach, które mają określoną ścisłą odpowiedzialność jest bardzo złym pomysłem, ponieważ nie można potem zrobić łatwego decouplingu jeżeli dany moduł będzie musiał być przeniesiony do nowej aplikacji serwisowej, w celu rozbicia monolitu na serwisy
