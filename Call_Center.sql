PGDMP                      }            Call_center    17.4    17.4 W    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    25187    Call_center    DATABASE     s   CREATE DATABASE "Call_center" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "Call_center";
                     postgres    false            j           1247    25220    pago    TYPE     e   CREATE TYPE public.pago AS ENUM (
    'Tarjeta',
    'Efectivo',
    'Transferencia',
    'Otros'
);
    DROP TYPE public.pago;
       public               postgres    false            g           1247    25210    paquete    TYPE     ]   CREATE TYPE public.paquete AS ENUM (
    'Paquete',
    'Sobres',
    'Caja',
    'Otros'
);
    DROP TYPE public.paquete;
       public               postgres    false            �            1259    25311    asignacion_ruta    TABLE     u   CREATE TABLE public.asignacion_ruta (
    idasignacion integer NOT NULL,
    idruta integer,
    idpedido integer
);
 #   DROP TABLE public.asignacion_ruta;
       public         heap r       postgres    false            �            1259    25310     asignacion_ruta_idasignacion_seq    SEQUENCE     �   CREATE SEQUENCE public.asignacion_ruta_idasignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.asignacion_ruta_idasignacion_seq;
       public               postgres    false    234            �           0    0     asignacion_ruta_idasignacion_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.asignacion_ruta_idasignacion_seq OWNED BY public.asignacion_ruta.idasignacion;
          public               postgres    false    233            �            1259    25198    cliente    TABLE       CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    direccion_id integer,
    telefono character varying(20),
    email character varying(100),
    nit character varying(20)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    25197    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public               postgres    false    220            �           0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;
          public               postgres    false    219            �            1259    25189 	   direccion    TABLE     �   CREATE TABLE public.direccion (
    iddireccion integer NOT NULL,
    direccion text NOT NULL,
    departamento character varying(100) NOT NULL,
    pais character varying(100) NOT NULL
);
    DROP TABLE public.direccion;
       public         heap r       postgres    false            �            1259    25188    direccion_iddireccion_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_iddireccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.direccion_iddireccion_seq;
       public               postgres    false    218            �           0    0    direccion_iddireccion_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.direccion_iddireccion_seq OWNED BY public.direccion.iddireccion;
          public               postgres    false    217            �            1259    25264 	   operadora    TABLE     �   CREATE TABLE public.operadora (
    idoperadora integer NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    email character varying(100),
    tipo character varying(50)
);
    DROP TABLE public.operadora;
       public         heap r       postgres    false            �            1259    25263    operadora_idoperadora_seq    SEQUENCE     �   CREATE SEQUENCE public.operadora_idoperadora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.operadora_idoperadora_seq;
       public               postgres    false    226            �           0    0    operadora_idoperadora_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.operadora_idoperadora_seq OWNED BY public.operadora.idoperadora;
          public               postgres    false    225            �            1259    25230    pedido    TABLE     b  CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idremitente integer,
    iddestinatario integer,
    tipo_paquete public.paquete NOT NULL,
    piezas integer NOT NULL,
    recoge_oficina boolean NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    ipo_pago public.pago NOT NULL,
    codigo integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap r       postgres    false    871    874            �            1259    25229    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public               postgres    false    222            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public               postgres    false    221            �            1259    25247    pedido_temporal    TABLE     )  CREATE TABLE public.pedido_temporal (
    idpedido integer NOT NULL,
    idremitente integer,
    iddestinatario integer,
    tipo_paquete public.paquete NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    ipo_pago public.pago NOT NULL,
    codigo integer NOT NULL
);
 #   DROP TABLE public.pedido_temporal;
       public         heap r       postgres    false    871    874            �            1259    25246    pedido_temporal_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_temporal_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.pedido_temporal_idpedido_seq;
       public               postgres    false    224            �           0    0    pedido_temporal_idpedido_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.pedido_temporal_idpedido_seq OWNED BY public.pedido_temporal.idpedido;
          public               postgres    false    223            �            1259    25328    rendimiento    TABLE     z   CREATE TABLE public.rendimiento (
    idrendimiento integer NOT NULL,
    fecha date NOT NULL,
    idoperadora integer
);
    DROP TABLE public.rendimiento;
       public         heap r       postgres    false            �            1259    25327    rendimiento_idrendimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.rendimiento_idrendimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.rendimiento_idrendimiento_seq;
       public               postgres    false    236            �           0    0    rendimiento_idrendimiento_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.rendimiento_idrendimiento_seq OWNED BY public.rendimiento.idrendimiento;
          public               postgres    false    235            �            1259    25294    ruta    TABLE     �   CREATE TABLE public.ruta (
    idruta integer NOT NULL,
    token_id integer,
    idsucursal integer,
    zona character varying(50),
    municipio character varying(100),
    departamento character varying(100),
    pais character varying(100)
);
    DROP TABLE public.ruta;
       public         heap r       postgres    false            �            1259    25293    ruta_idruta_seq    SEQUENCE     �   CREATE SEQUENCE public.ruta_idruta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ruta_idruta_seq;
       public               postgres    false    232            �           0    0    ruta_idruta_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.ruta_idruta_seq OWNED BY public.ruta.idruta;
          public               postgres    false    231            �            1259    25285    sucursal    TABLE     ?  CREATE TABLE public.sucursal (
    idsucursal integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text NOT NULL,
    telefono character varying(20),
    zona character varying(50),
    municipio character varying(100),
    departamento character varying(100),
    pais character varying(100)
);
    DROP TABLE public.sucursal;
       public         heap r       postgres    false            �            1259    25284    sucursal_idsucursal_seq    SEQUENCE     �   CREATE SEQUENCE public.sucursal_idsucursal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sucursal_idsucursal_seq;
       public               postgres    false    230            �           0    0    sucursal_idsucursal_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sucursal_idsucursal_seq OWNED BY public.sucursal.idsucursal;
          public               postgres    false    229            �            1259    25271    token    TABLE     �   CREATE TABLE public.token (
    idtoken integer NOT NULL,
    token integer NOT NULL,
    usuario_solicitante integer,
    tarifa double precision NOT NULL,
    descripcion text
);
    DROP TABLE public.token;
       public         heap r       postgres    false            �            1259    25270    token_idtoken_seq    SEQUENCE     �   CREATE SEQUENCE public.token_idtoken_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.token_idtoken_seq;
       public               postgres    false    228            �           0    0    token_idtoken_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.token_idtoken_seq OWNED BY public.token.idtoken;
          public               postgres    false    227            �           2604    25314    asignacion_ruta idasignacion    DEFAULT     �   ALTER TABLE ONLY public.asignacion_ruta ALTER COLUMN idasignacion SET DEFAULT nextval('public.asignacion_ruta_idasignacion_seq'::regclass);
 K   ALTER TABLE public.asignacion_ruta ALTER COLUMN idasignacion DROP DEFAULT;
       public               postgres    false    234    233    234            �           2604    25201    cliente idcliente    DEFAULT     v   ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 @   ALTER TABLE public.cliente ALTER COLUMN idcliente DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    25192    direccion iddireccion    DEFAULT     ~   ALTER TABLE ONLY public.direccion ALTER COLUMN iddireccion SET DEFAULT nextval('public.direccion_iddireccion_seq'::regclass);
 D   ALTER TABLE public.direccion ALTER COLUMN iddireccion DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    25267    operadora idoperadora    DEFAULT     ~   ALTER TABLE ONLY public.operadora ALTER COLUMN idoperadora SET DEFAULT nextval('public.operadora_idoperadora_seq'::regclass);
 D   ALTER TABLE public.operadora ALTER COLUMN idoperadora DROP DEFAULT;
       public               postgres    false    225    226    226            �           2604    25233    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    25250    pedido_temporal idpedido    DEFAULT     �   ALTER TABLE ONLY public.pedido_temporal ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_temporal_idpedido_seq'::regclass);
 G   ALTER TABLE public.pedido_temporal ALTER COLUMN idpedido DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    25331    rendimiento idrendimiento    DEFAULT     �   ALTER TABLE ONLY public.rendimiento ALTER COLUMN idrendimiento SET DEFAULT nextval('public.rendimiento_idrendimiento_seq'::regclass);
 H   ALTER TABLE public.rendimiento ALTER COLUMN idrendimiento DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    25297    ruta idruta    DEFAULT     j   ALTER TABLE ONLY public.ruta ALTER COLUMN idruta SET DEFAULT nextval('public.ruta_idruta_seq'::regclass);
 :   ALTER TABLE public.ruta ALTER COLUMN idruta DROP DEFAULT;
       public               postgres    false    231    232    232            �           2604    25288    sucursal idsucursal    DEFAULT     z   ALTER TABLE ONLY public.sucursal ALTER COLUMN idsucursal SET DEFAULT nextval('public.sucursal_idsucursal_seq'::regclass);
 B   ALTER TABLE public.sucursal ALTER COLUMN idsucursal DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    25274    token idtoken    DEFAULT     n   ALTER TABLE ONLY public.token ALTER COLUMN idtoken SET DEFAULT nextval('public.token_idtoken_seq'::regclass);
 <   ALTER TABLE public.token ALTER COLUMN idtoken DROP DEFAULT;
       public               postgres    false    227    228    228            �          0    25311    asignacion_ruta 
   TABLE DATA           I   COPY public.asignacion_ruta (idasignacion, idruta, idpedido) FROM stdin;
    public               postgres    false    234   �k       v          0    25198    cliente 
   TABLE DATA           b   COPY public.cliente (idcliente, nombre, apellido, direccion_id, telefono, email, nit) FROM stdin;
    public               postgres    false    220   �k       t          0    25189 	   direccion 
   TABLE DATA           O   COPY public.direccion (iddireccion, direccion, departamento, pais) FROM stdin;
    public               postgres    false    218   �k       |          0    25264 	   operadora 
   TABLE DATA           O   COPY public.operadora (idoperadora, nombre, telefono, email, tipo) FROM stdin;
    public               postgres    false    226   l       x          0    25230    pedido 
   TABLE DATA           �   COPY public.pedido (idpedido, idremitente, iddestinatario, tipo_paquete, piezas, recoge_oficina, fecha, hora, ipo_pago, codigo) FROM stdin;
    public               postgres    false    222   *l       z          0    25247    pedido_temporal 
   TABLE DATA           }   COPY public.pedido_temporal (idpedido, idremitente, iddestinatario, tipo_paquete, fecha, hora, ipo_pago, codigo) FROM stdin;
    public               postgres    false    224   Gl       �          0    25328    rendimiento 
   TABLE DATA           H   COPY public.rendimiento (idrendimiento, fecha, idoperadora) FROM stdin;
    public               postgres    false    236   dl       �          0    25294    ruta 
   TABLE DATA           a   COPY public.ruta (idruta, token_id, idsucursal, zona, municipio, departamento, pais) FROM stdin;
    public               postgres    false    232   �l       �          0    25285    sucursal 
   TABLE DATA           p   COPY public.sucursal (idsucursal, nombre, direccion, telefono, zona, municipio, departamento, pais) FROM stdin;
    public               postgres    false    230   �l       ~          0    25271    token 
   TABLE DATA           Y   COPY public.token (idtoken, token, usuario_solicitante, tarifa, descripcion) FROM stdin;
    public               postgres    false    228   �l       �           0    0     asignacion_ruta_idasignacion_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.asignacion_ruta_idasignacion_seq', 1, false);
          public               postgres    false    233            �           0    0    cliente_idcliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 1, false);
          public               postgres    false    219            �           0    0    direccion_iddireccion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.direccion_iddireccion_seq', 1, false);
          public               postgres    false    217            �           0    0    operadora_idoperadora_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.operadora_idoperadora_seq', 1, false);
          public               postgres    false    225            �           0    0    pedido_idpedido_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 1, false);
          public               postgres    false    221            �           0    0    pedido_temporal_idpedido_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.pedido_temporal_idpedido_seq', 1, false);
          public               postgres    false    223            �           0    0    rendimiento_idrendimiento_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.rendimiento_idrendimiento_seq', 1, false);
          public               postgres    false    235            �           0    0    ruta_idruta_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.ruta_idruta_seq', 1, false);
          public               postgres    false    231            �           0    0    sucursal_idsucursal_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sucursal_idsucursal_seq', 1, false);
          public               postgres    false    229            �           0    0    token_idtoken_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.token_idtoken_seq', 1, false);
          public               postgres    false    227            �           2606    25316 $   asignacion_ruta asignacion_ruta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.asignacion_ruta
    ADD CONSTRAINT asignacion_ruta_pkey PRIMARY KEY (idasignacion);
 N   ALTER TABLE ONLY public.asignacion_ruta DROP CONSTRAINT asignacion_ruta_pkey;
       public                 postgres    false    234            �           2606    25203    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    220            �           2606    25196    direccion direccion_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (iddireccion);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public                 postgres    false    218            �           2606    25269    operadora operadora_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.operadora
    ADD CONSTRAINT operadora_pkey PRIMARY KEY (idoperadora);
 B   ALTER TABLE ONLY public.operadora DROP CONSTRAINT operadora_pkey;
       public                 postgres    false    226            �           2606    25235    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public                 postgres    false    222            �           2606    25252 $   pedido_temporal pedido_temporal_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pedido_temporal
    ADD CONSTRAINT pedido_temporal_pkey PRIMARY KEY (idpedido);
 N   ALTER TABLE ONLY public.pedido_temporal DROP CONSTRAINT pedido_temporal_pkey;
       public                 postgres    false    224            �           2606    25333    rendimiento rendimiento_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.rendimiento
    ADD CONSTRAINT rendimiento_pkey PRIMARY KEY (idrendimiento);
 F   ALTER TABLE ONLY public.rendimiento DROP CONSTRAINT rendimiento_pkey;
       public                 postgres    false    236            �           2606    25299    ruta ruta_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (idruta);
 8   ALTER TABLE ONLY public.ruta DROP CONSTRAINT ruta_pkey;
       public                 postgres    false    232            �           2606    25292    sucursal sucursal_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (idsucursal);
 @   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT sucursal_pkey;
       public                 postgres    false    230            �           2606    25278    token token_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (idtoken);
 :   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pkey;
       public                 postgres    false    228            �           2606    25322 -   asignacion_ruta asignacion_ruta_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_ruta
    ADD CONSTRAINT asignacion_ruta_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 W   ALTER TABLE ONLY public.asignacion_ruta DROP CONSTRAINT asignacion_ruta_idpedido_fkey;
       public               postgres    false    234    222    4808            �           2606    25317 +   asignacion_ruta asignacion_ruta_idruta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_ruta
    ADD CONSTRAINT asignacion_ruta_idruta_fkey FOREIGN KEY (idruta) REFERENCES public.ruta(idruta);
 U   ALTER TABLE ONLY public.asignacion_ruta DROP CONSTRAINT asignacion_ruta_idruta_fkey;
       public               postgres    false    4818    234    232            �           2606    25204 !   cliente cliente_direccion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_direccion_id_fkey FOREIGN KEY (direccion_id) REFERENCES public.direccion(iddireccion);
 K   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_direccion_id_fkey;
       public               postgres    false    218    4804    220            �           2606    25241 !   pedido pedido_iddestinatario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_iddestinatario_fkey FOREIGN KEY (iddestinatario) REFERENCES public.cliente(idcliente);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_iddestinatario_fkey;
       public               postgres    false    220    222    4806            �           2606    25236    pedido pedido_idremitente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idremitente_fkey FOREIGN KEY (idremitente) REFERENCES public.cliente(idcliente);
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idremitente_fkey;
       public               postgres    false    4806    222    220            �           2606    25258 3   pedido_temporal pedido_temporal_iddestinatario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_temporal
    ADD CONSTRAINT pedido_temporal_iddestinatario_fkey FOREIGN KEY (iddestinatario) REFERENCES public.cliente(idcliente);
 ]   ALTER TABLE ONLY public.pedido_temporal DROP CONSTRAINT pedido_temporal_iddestinatario_fkey;
       public               postgres    false    4806    220    224            �           2606    25253 0   pedido_temporal pedido_temporal_idremitente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_temporal
    ADD CONSTRAINT pedido_temporal_idremitente_fkey FOREIGN KEY (idremitente) REFERENCES public.cliente(idcliente);
 Z   ALTER TABLE ONLY public.pedido_temporal DROP CONSTRAINT pedido_temporal_idremitente_fkey;
       public               postgres    false    224    4806    220            �           2606    25334 (   rendimiento rendimiento_idoperadora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rendimiento
    ADD CONSTRAINT rendimiento_idoperadora_fkey FOREIGN KEY (idoperadora) REFERENCES public.operadora(idoperadora);
 R   ALTER TABLE ONLY public.rendimiento DROP CONSTRAINT rendimiento_idoperadora_fkey;
       public               postgres    false    236    226    4812            �           2606    25305    ruta ruta_idsucursal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_idsucursal_fkey FOREIGN KEY (idsucursal) REFERENCES public.sucursal(idsucursal);
 C   ALTER TABLE ONLY public.ruta DROP CONSTRAINT ruta_idsucursal_fkey;
       public               postgres    false    4816    230    232            �           2606    25300    ruta ruta_token_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.token(idtoken);
 A   ALTER TABLE ONLY public.ruta DROP CONSTRAINT ruta_token_id_fkey;
       public               postgres    false    232    4814    228            �           2606    25279 $   token token_usuario_solicitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_usuario_solicitante_fkey FOREIGN KEY (usuario_solicitante) REFERENCES public.operadora(idoperadora);
 N   ALTER TABLE ONLY public.token DROP CONSTRAINT token_usuario_solicitante_fkey;
       public               postgres    false    228    226    4812            �      x������ � �      v      x������ � �      t      x������ � �      |      x������ � �      x      x������ � �      z      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      ~      x������ � �     