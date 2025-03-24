PGDMP      0                }            Call_center    17.4    17.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    25187    Call_center    DATABASE     s   CREATE DATABASE "Call_center" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "Call_center";
                     postgres    false            j          0    25189 	   direccion 
   TABLE DATA           O   COPY public.direccion (iddireccion, direccion, departamento, pais) FROM stdin;
    public               postgres    false    218   �       l          0    25198    cliente 
   TABLE DATA           b   COPY public.cliente (idcliente, nombre, apellido, direccion_id, telefono, email, nit) FROM stdin;
    public               postgres    false    220   �       r          0    25264 	   operadora 
   TABLE DATA           O   COPY public.operadora (idoperadora, nombre, telefono, email, tipo) FROM stdin;
    public               postgres    false    226   �       n          0    25230    pedido 
   TABLE DATA           �   COPY public.pedido (idpedido, idremitente, iddestinatario, tipo_paquete, piezas, recoge_oficina, fecha, hora, ipo_pago, codigo) FROM stdin;
    public               postgres    false    222          v          0    25285    sucursal 
   TABLE DATA           p   COPY public.sucursal (idsucursal, nombre, direccion, telefono, zona, municipio, departamento, pais) FROM stdin;
    public               postgres    false    230   -       t          0    25271    token 
   TABLE DATA           Y   COPY public.token (idtoken, token, usuario_solicitante, tarifa, descripcion) FROM stdin;
    public               postgres    false    228   J       x          0    25294    ruta 
   TABLE DATA           a   COPY public.ruta (idruta, token_id, idsucursal, zona, municipio, departamento, pais) FROM stdin;
    public               postgres    false    232   g       z          0    25311    asignacion_ruta 
   TABLE DATA           I   COPY public.asignacion_ruta (idasignacion, idruta, idpedido) FROM stdin;
    public               postgres    false    234   �       p          0    25247    pedido_temporal 
   TABLE DATA           }   COPY public.pedido_temporal (idpedido, idremitente, iddestinatario, tipo_paquete, fecha, hora, ipo_pago, codigo) FROM stdin;
    public               postgres    false    224   �       |          0    25328    rendimiento 
   TABLE DATA           H   COPY public.rendimiento (idrendimiento, fecha, idoperadora) FROM stdin;
    public               postgres    false    236   �       �           0    0     asignacion_ruta_idasignacion_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.asignacion_ruta_idasignacion_seq', 1, false);
          public               postgres    false    233            �           0    0    cliente_idcliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 1, false);
          public               postgres    false    219            �           0    0    direccion_iddireccion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.direccion_iddireccion_seq', 1, false);
          public               postgres    false    217            �           0    0    operadora_idoperadora_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.operadora_idoperadora_seq', 1, false);
          public               postgres    false    225            �           0    0    pedido_idpedido_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 1, false);
          public               postgres    false    221            �           0    0    pedido_temporal_idpedido_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.pedido_temporal_idpedido_seq', 1, false);
          public               postgres    false    223            �           0    0    rendimiento_idrendimiento_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.rendimiento_idrendimiento_seq', 1, false);
          public               postgres    false    235            �           0    0    ruta_idruta_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.ruta_idruta_seq', 1, false);
          public               postgres    false    231            �           0    0    sucursal_idsucursal_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sucursal_idsucursal_seq', 1, false);
          public               postgres    false    229            �           0    0    token_idtoken_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.token_idtoken_seq', 1, false);
          public               postgres    false    227            j      x������ � �      l      x������ � �      r      x������ � �      n      x������ � �      v      x������ � �      t      x������ � �      x      x������ � �      z      x������ � �      p      x������ � �      |      x������ � �     