CREATE TABLE IF NOT EXISTS driver (
    id SERIAL PRIMARY KEY,
    full_name  varchar(64),
    expirience integer,
    age integer,
    available BOOLEAN
    );



CREATE TABLE IF NOT EXISTS truck (
                                     id SERIAL PRIMARY KEY,
                                     maxWeight integer,
                                     available boolean,
                                     repairability boolean,
                                     name varchar(64)
);

CREATE TABLE IF NOT EXISTS truck_driver (
              id SERIAL PRIMARY KEY,
             truckId integer,
               driverId integer,
              FOREIGN KEY (driverId) REFERENCES public.driver(id) ON DELETE CASCADE,
    FOREIGN KEY (truckId) REFERENCES public.truck(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS truck_repair (
                    id SERIAL PRIMARY KEY,
                     day integer,
                     truckId integer,
                     FOREIGN KEY (truckId) REFERENCES public.truck(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cargo (
                              id SERIAL PRIMARY KEY,
                              levelDriverExpirience integer,
                              name varchar(255)
);

CREATE TABLE IF NOT EXISTS  destination (
                                    id SERIAL PRIMARY KEY,
                                    summa double precision,
                                    name varchar(255)
);

CREATE TABLE IF NOT EXISTS  orders (
                              id SERIAL PRIMARY KEY,
                              weight integer,
                              cargoId integer,
                              destinationId integer,
                              status varchar(255),
                              FOREIGN KEY (destinationId) REFERENCES public.destination(id) ON DELETE CASCADE,
                              FOREIGN KEY (cargoId) REFERENCES public.cargo(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS route (
                              id SERIAL PRIMARY KEY,
                              date integer,
                              truck_driverId integer,
                              orderId integer,
                              FOREIGN KEY (truck_driverId) REFERENCES public.truck_driver(id) ON DELETE CASCADE,
                              FOREIGN KEY (orderId) REFERENCES public.orders(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_route (
                                    id SERIAL PRIMARY KEY,
                                    orderId integer,
                                    routeId integer,
                                    FOREIGN KEY (orderId) REFERENCES public.orders(id) ON DELETE CASCADE,
                                    FOREIGN KEY (routeId) REFERENCES public.route(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS salary (
                                      id SERIAL PRIMARY KEY,
                                      summa double precision,
                                      driverId integer,
                                      routeId integer,
                                      FOREIGN KEY (driverId) REFERENCES public.driver(id) ON DELETE CASCADE,
                                      FOREIGN KEY (routeId) REFERENCES public.route(id) ON DELETE CASCADE
    );