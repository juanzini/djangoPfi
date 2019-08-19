PGDMP     2    7                w            dcerrtscdbt03n     11.5 (Ubuntu 11.5-1.pgdg16.04+1)    11.2 <   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    17059    dcerrtscdbt03n    DATABASE     �   CREATE DATABASE "dcerrtscdbt03n" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
     DROP DATABASE "dcerrtscdbt03n";
             bfiknbgrtbqgnw    false            �            1259    2729254    alumno_alumno    TABLE     q  CREATE TABLE "public"."alumno_alumno" (
    "id" integer NOT NULL,
    "numero_registro" integer NOT NULL,
    "curriculum" character varying(100) NOT NULL,
    "plan_de_estudio" character varying(100) NOT NULL,
    "historia_academica" character varying(100) NOT NULL,
    "descripcion_intereses" "text",
    "descripcion_habilidades" "text",
    "ultima_actualizacion_perfil" "date" NOT NULL,
    "ultima_postulacion" "date",
    "condicion_acreditacion" boolean,
    "expedicion_acreditacion" "text",
    "comentarios_comision_carrera" "text",
    "comentarios_carrera_visibles" boolean NOT NULL,
    "comentarios_comision_pps" "text",
    "perfil" character varying(100),
    "progreso" smallint NOT NULL,
    "carrera_id" character varying(100) NOT NULL,
    "user_id" integer NOT NULL,
    CONSTRAINT "alumno_alumno_numero_registro_check" CHECK (("numero_registro" >= 0))
);
 %   DROP TABLE "public"."alumno_alumno";
       public         bfiknbgrtbqgnw    false            �            1259    2729252    alumno_alumno_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_alumno_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE "public"."alumno_alumno_id_seq";
       public       bfiknbgrtbqgnw    false    213            �           0    0    alumno_alumno_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "public"."alumno_alumno_id_seq" OWNED BY "public"."alumno_alumno"."id";
            public       bfiknbgrtbqgnw    false    212            �            1259    2729266    alumno_carrera    TABLE     �   CREATE TABLE "public"."alumno_carrera" (
    "nombre" character varying(100) NOT NULL,
    "departamento_id" character varying(50) NOT NULL
);
 &   DROP TABLE "public"."alumno_carrera";
       public         bfiknbgrtbqgnw    false            �            1259    2729271    alumno_departamento    TABLE     ]   CREATE TABLE "public"."alumno_departamento" (
    "nombre" character varying(50) NOT NULL
);
 +   DROP TABLE "public"."alumno_departamento";
       public         bfiknbgrtbqgnw    false            �            1259    2729389    alumno_directordepartamento    TABLE     �   CREATE TABLE "public"."alumno_directordepartamento" (
    "id" integer NOT NULL,
    "departamento_id" character varying(50) NOT NULL,
    "docente_id" character varying(254) NOT NULL
);
 3   DROP TABLE "public"."alumno_directordepartamento";
       public         bfiknbgrtbqgnw    false            �            1259    2729387 "   alumno_directordepartamento_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_directordepartamento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "public"."alumno_directordepartamento_id_seq";
       public       bfiknbgrtbqgnw    false    237            �           0    0 "   alumno_directordepartamento_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "public"."alumno_directordepartamento_id_seq" OWNED BY "public"."alumno_directordepartamento"."id";
            public       bfiknbgrtbqgnw    false    236            �            1259    2729276    alumno_docente    TABLE       CREATE TABLE "public"."alumno_docente" (
    "nombre" character varying(30) NOT NULL,
    "apellido" character varying(20) NOT NULL,
    "email" character varying(254) NOT NULL,
    "box_oficina" character varying(30) NOT NULL,
    "departamento_id" character varying(50)
);
 &   DROP TABLE "public"."alumno_docente";
       public         bfiknbgrtbqgnw    false            �            1259    2729283    alumno_empresa    TABLE     2  CREATE TABLE "public"."alumno_empresa" (
    "id" integer NOT NULL,
    "descripcion" "text",
    "url" character varying(200),
    "logo" character varying(100),
    "nombre_fantasia" character varying(200) NOT NULL,
    "departamento_id" character varying(50) NOT NULL,
    "user_id" integer NOT NULL
);
 &   DROP TABLE "public"."alumno_empresa";
       public         bfiknbgrtbqgnw    false            �            1259    2729281    alumno_empresa_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_empresa_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE "public"."alumno_empresa_id_seq";
       public       bfiknbgrtbqgnw    false    218            �           0    0    alumno_empresa_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE "public"."alumno_empresa_id_seq" OWNED BY "public"."alumno_empresa"."id";
            public       bfiknbgrtbqgnw    false    217            �            1259    2729296    alumno_entrevista    TABLE     �  CREATE TABLE "public"."alumno_entrevista" (
    "id" integer NOT NULL,
    "fecha" timestamp with time zone NOT NULL,
    "lugar" character varying(200) NOT NULL,
    "resultado" "text",
    "pasantia_aceptada" boolean,
    "comentarios_empresa" "text",
    "comentarios_comision_pps" "text",
    "status" character varying(3) NOT NULL,
    "alumno_id" integer NOT NULL,
    "empresa_id" integer NOT NULL
);
 )   DROP TABLE "public"."alumno_entrevista";
       public         bfiknbgrtbqgnw    false            �            1259    2729294    alumno_entrevista_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_entrevista_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "public"."alumno_entrevista_id_seq";
       public       bfiknbgrtbqgnw    false    220            �           0    0    alumno_entrevista_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "public"."alumno_entrevista_id_seq" OWNED BY "public"."alumno_entrevista"."id";
            public       bfiknbgrtbqgnw    false    219            �            1259    2729363    alumno_pasantia    TABLE     �  CREATE TABLE "public"."alumno_pasantia" (
    "id" integer NOT NULL,
    "fecha_inicio" "date" NOT NULL,
    "fecha_fin" "date" NOT NULL,
    "informe" character varying(100),
    "numero_legajo" integer,
    "comentarios_empresa" "text",
    "comentarios_comision_pps" "text",
    "entrevista_id" integer NOT NULL,
    "tutor_docente_id" character varying(254),
    "tutor_empresa_id" character varying(254),
    CONSTRAINT "alumno_pasantia_numero_legajo_check" CHECK (("numero_legajo" >= 0))
);
 '   DROP TABLE "public"."alumno_pasantia";
       public         bfiknbgrtbqgnw    false            �            1259    2729361    alumno_pasantia_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_pasantia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "public"."alumno_pasantia_id_seq";
       public       bfiknbgrtbqgnw    false    233            �           0    0    alumno_pasantia_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "public"."alumno_pasantia_id_seq" OWNED BY "public"."alumno_pasantia"."id";
            public       bfiknbgrtbqgnw    false    232            �            1259    2729379    alumno_postulacion    TABLE     	  CREATE TABLE "public"."alumno_postulacion" (
    "id" integer NOT NULL,
    "fecha" "date" NOT NULL,
    "fecha_desestimacion" "date",
    "activa" boolean NOT NULL,
    "alumno_id" integer NOT NULL,
    "entrevista_id" integer,
    "puesto_id" integer NOT NULL
);
 *   DROP TABLE "public"."alumno_postulacion";
       public         bfiknbgrtbqgnw    false            �            1259    2729377    alumno_postulacion_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_postulacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "public"."alumno_postulacion_id_seq";
       public       bfiknbgrtbqgnw    false    235            �           0    0    alumno_postulacion_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "public"."alumno_postulacion_id_seq" OWNED BY "public"."alumno_postulacion"."id";
            public       bfiknbgrtbqgnw    false    234            �            1259    2729352    alumno_puesto    TABLE     h  CREATE TABLE "public"."alumno_puesto" (
    "puesto_id" integer NOT NULL,
    "nombre" character varying(3) NOT NULL,
    "descripcion_actividades" "text" NOT NULL,
    "conocimientos_requeridos" "text" NOT NULL,
    "horario" character varying(100) NOT NULL,
    "rentado" boolean NOT NULL,
    "activo" boolean NOT NULL,
    "empresa_id" integer NOT NULL
);
 %   DROP TABLE "public"."alumno_puesto";
       public         bfiknbgrtbqgnw    false            �            1259    2729350    alumno_puesto_puesto_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_puesto_puesto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE "public"."alumno_puesto_puesto_id_seq";
       public       bfiknbgrtbqgnw    false    231            �           0    0    alumno_puesto_puesto_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "public"."alumno_puesto_puesto_id_seq" OWNED BY "public"."alumno_puesto"."puesto_id";
            public       bfiknbgrtbqgnw    false    230            �            1259    2729332    alumno_subcomisioncarrera    TABLE     �   CREATE TABLE "public"."alumno_subcomisioncarrera" (
    "id" integer NOT NULL,
    "carrera_id" character varying(100) NOT NULL,
    "user_id" integer NOT NULL
);
 1   DROP TABLE "public"."alumno_subcomisioncarrera";
       public         bfiknbgrtbqgnw    false            �            1259    2729344 "   alumno_subcomisioncarrera_docentes    TABLE     �   CREATE TABLE "public"."alumno_subcomisioncarrera_docentes" (
    "id" integer NOT NULL,
    "subcomisioncarrera_id" integer NOT NULL,
    "docente_id" character varying(254) NOT NULL
);
 :   DROP TABLE "public"."alumno_subcomisioncarrera_docentes";
       public         bfiknbgrtbqgnw    false            �            1259    2729342 )   alumno_subcomisioncarrera_docentes_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_subcomisioncarrera_docentes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE "public"."alumno_subcomisioncarrera_docentes_id_seq";
       public       bfiknbgrtbqgnw    false    229            �           0    0 )   alumno_subcomisioncarrera_docentes_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."alumno_subcomisioncarrera_docentes_id_seq" OWNED BY "public"."alumno_subcomisioncarrera_docentes"."id";
            public       bfiknbgrtbqgnw    false    228            �            1259    2729330     alumno_subcomisioncarrera_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_subcomisioncarrera_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "public"."alumno_subcomisioncarrera_id_seq";
       public       bfiknbgrtbqgnw    false    227            �           0    0     alumno_subcomisioncarrera_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE "public"."alumno_subcomisioncarrera_id_seq" OWNED BY "public"."alumno_subcomisioncarrera"."id";
            public       bfiknbgrtbqgnw    false    226            �            1259    2729312    alumno_subcomisionpasantiaspps    TABLE     �   CREATE TABLE "public"."alumno_subcomisionpasantiaspps" (
    "id" integer NOT NULL,
    "departamento_id" character varying(50) NOT NULL,
    "user_id" integer NOT NULL
);
 6   DROP TABLE "public"."alumno_subcomisionpasantiaspps";
       public         bfiknbgrtbqgnw    false            �            1259    2729324 '   alumno_subcomisionpasantiaspps_docentes    TABLE     �   CREATE TABLE "public"."alumno_subcomisionpasantiaspps_docentes" (
    "id" integer NOT NULL,
    "subcomisionpasantiaspps_id" integer NOT NULL,
    "docente_id" character varying(254) NOT NULL
);
 ?   DROP TABLE "public"."alumno_subcomisionpasantiaspps_docentes";
       public         bfiknbgrtbqgnw    false            �            1259    2729322 .   alumno_subcomisionpasantiaspps_docentes_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_subcomisionpasantiaspps_docentes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE "public"."alumno_subcomisionpasantiaspps_docentes_id_seq";
       public       bfiknbgrtbqgnw    false    225            �           0    0 .   alumno_subcomisionpasantiaspps_docentes_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."alumno_subcomisionpasantiaspps_docentes_id_seq" OWNED BY "public"."alumno_subcomisionpasantiaspps_docentes"."id";
            public       bfiknbgrtbqgnw    false    224            �            1259    2729310 %   alumno_subcomisionpasantiaspps_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_subcomisionpasantiaspps_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE "public"."alumno_subcomisionpasantiaspps_id_seq";
       public       bfiknbgrtbqgnw    false    223            �           0    0 %   alumno_subcomisionpasantiaspps_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE "public"."alumno_subcomisionpasantiaspps_id_seq" OWNED BY "public"."alumno_subcomisionpasantiaspps"."id";
            public       bfiknbgrtbqgnw    false    222            �            1259    2729305    alumno_tutorempresa    TABLE       CREATE TABLE "public"."alumno_tutorempresa" (
    "nombre" character varying(30) NOT NULL,
    "apellido" character varying(20) NOT NULL,
    "cargo" character varying(30) NOT NULL,
    "mail" character varying(254) NOT NULL,
    "empresa_id" integer NOT NULL
);
 +   DROP TABLE "public"."alumno_tutorempresa";
       public         bfiknbgrtbqgnw    false            �            1259    2729225    alumno_user    TABLE     $  CREATE TABLE "public"."alumno_user" (
    "id" integer NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamp with time zone,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(30) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamp with time zone NOT NULL,
    "tipo" character varying(2) NOT NULL
);
 #   DROP TABLE "public"."alumno_user";
       public         bfiknbgrtbqgnw    false            �            1259    2729238    alumno_user_groups    TABLE     �   CREATE TABLE "public"."alumno_user_groups" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL
);
 *   DROP TABLE "public"."alumno_user_groups";
       public         bfiknbgrtbqgnw    false            �            1259    2729236    alumno_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "public"."alumno_user_groups_id_seq";
       public       bfiknbgrtbqgnw    false    209            �           0    0    alumno_user_groups_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "public"."alumno_user_groups_id_seq" OWNED BY "public"."alumno_user_groups"."id";
            public       bfiknbgrtbqgnw    false    208            �            1259    2729223    alumno_user_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "public"."alumno_user_id_seq";
       public       bfiknbgrtbqgnw    false    207            �           0    0    alumno_user_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE "public"."alumno_user_id_seq" OWNED BY "public"."alumno_user"."id";
            public       bfiknbgrtbqgnw    false    206            �            1259    2729246    alumno_user_user_permissions    TABLE     �   CREATE TABLE "public"."alumno_user_user_permissions" (
    "id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);
 4   DROP TABLE "public"."alumno_user_user_permissions";
       public         bfiknbgrtbqgnw    false            �            1259    2729244 #   alumno_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."alumno_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "public"."alumno_user_user_permissions_id_seq";
       public       bfiknbgrtbqgnw    false    211            �           0    0 #   alumno_user_user_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "public"."alumno_user_user_permissions_id_seq" OWNED BY "public"."alumno_user_user_permissions"."id";
            public       bfiknbgrtbqgnw    false    210            �            1259    2729181 
   auth_group    TABLE     n   CREATE TABLE "public"."auth_group" (
    "id" integer NOT NULL,
    "name" character varying(150) NOT NULL
);
 "   DROP TABLE "public"."auth_group";
       public         bfiknbgrtbqgnw    false            �            1259    2729179    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."auth_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE "public"."auth_group_id_seq";
       public       bfiknbgrtbqgnw    false    203            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "public"."auth_group_id_seq" OWNED BY "public"."auth_group"."id";
            public       bfiknbgrtbqgnw    false    202            �            1259    2729191    auth_group_permissions    TABLE     �   CREATE TABLE "public"."auth_group_permissions" (
    "id" integer NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);
 .   DROP TABLE "public"."auth_group_permissions";
       public         bfiknbgrtbqgnw    false            �            1259    2729189    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."auth_group_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "public"."auth_group_permissions_id_seq";
       public       bfiknbgrtbqgnw    false    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE "public"."auth_group_permissions_id_seq" OWNED BY "public"."auth_group_permissions"."id";
            public       bfiknbgrtbqgnw    false    204            �            1259    2729173    auth_permission    TABLE     �   CREATE TABLE "public"."auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);
 '   DROP TABLE "public"."auth_permission";
       public         bfiknbgrtbqgnw    false            �            1259    2729171    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."auth_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "public"."auth_permission_id_seq";
       public       bfiknbgrtbqgnw    false    201            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "public"."auth_permission_id_seq" OWNED BY "public"."auth_permission"."id";
            public       bfiknbgrtbqgnw    false    200            �            1259    2729609    django_admin_log    TABLE     �  CREATE TABLE "public"."django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);
 (   DROP TABLE "public"."django_admin_log";
       public         bfiknbgrtbqgnw    false            �            1259    2729607    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_admin_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "public"."django_admin_log_id_seq";
       public       bfiknbgrtbqgnw    false    239            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "public"."django_admin_log_id_seq" OWNED BY "public"."django_admin_log"."id";
            public       bfiknbgrtbqgnw    false    238            �            1259    2729633 "   django_celery_beat_crontabschedule    TABLE     |  CREATE TABLE "public"."django_celery_beat_crontabschedule" (
    "id" integer NOT NULL,
    "minute" character varying(240) NOT NULL,
    "hour" character varying(96) NOT NULL,
    "day_of_week" character varying(64) NOT NULL,
    "day_of_month" character varying(124) NOT NULL,
    "month_of_year" character varying(64) NOT NULL,
    "timezone" character varying(63) NOT NULL
);
 :   DROP TABLE "public"."django_celery_beat_crontabschedule";
       public         bfiknbgrtbqgnw    false            �            1259    2729631 )   django_celery_beat_crontabschedule_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_celery_beat_crontabschedule_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE "public"."django_celery_beat_crontabschedule_id_seq";
       public       bfiknbgrtbqgnw    false    241            �           0    0 )   django_celery_beat_crontabschedule_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."django_celery_beat_crontabschedule_id_seq" OWNED BY "public"."django_celery_beat_crontabschedule"."id";
            public       bfiknbgrtbqgnw    false    240            �            1259    2729641 #   django_celery_beat_intervalschedule    TABLE     �   CREATE TABLE "public"."django_celery_beat_intervalschedule" (
    "id" integer NOT NULL,
    "every" integer NOT NULL,
    "period" character varying(24) NOT NULL
);
 ;   DROP TABLE "public"."django_celery_beat_intervalschedule";
       public         bfiknbgrtbqgnw    false            �            1259    2729639 *   django_celery_beat_intervalschedule_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_celery_beat_intervalschedule_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "public"."django_celery_beat_intervalschedule_id_seq";
       public       bfiknbgrtbqgnw    false    243            �           0    0 *   django_celery_beat_intervalschedule_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."django_celery_beat_intervalschedule_id_seq" OWNED BY "public"."django_celery_beat_intervalschedule"."id";
            public       bfiknbgrtbqgnw    false    242            �            1259    2729649    django_celery_beat_periodictask    TABLE     �  CREATE TABLE "public"."django_celery_beat_periodictask" (
    "id" integer NOT NULL,
    "name" character varying(200) NOT NULL,
    "task" character varying(200) NOT NULL,
    "args" "text" NOT NULL,
    "kwargs" "text" NOT NULL,
    "queue" character varying(200),
    "exchange" character varying(200),
    "routing_key" character varying(200),
    "expires" timestamp with time zone,
    "enabled" boolean NOT NULL,
    "last_run_at" timestamp with time zone,
    "total_run_count" integer NOT NULL,
    "date_changed" timestamp with time zone NOT NULL,
    "description" "text" NOT NULL,
    "crontab_id" integer,
    "interval_id" integer,
    "solar_id" integer,
    "one_off" boolean NOT NULL,
    "start_time" timestamp with time zone,
    "priority" integer,
    CONSTRAINT "django_celery_beat_periodictask_priority_check" CHECK (("priority" >= 0)),
    CONSTRAINT "django_celery_beat_periodictask_total_run_count_check" CHECK (("total_run_count" >= 0))
);
 7   DROP TABLE "public"."django_celery_beat_periodictask";
       public         bfiknbgrtbqgnw    false            �            1259    2729647 &   django_celery_beat_periodictask_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_celery_beat_periodictask_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE "public"."django_celery_beat_periodictask_id_seq";
       public       bfiknbgrtbqgnw    false    245            �           0    0 &   django_celery_beat_periodictask_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE "public"."django_celery_beat_periodictask_id_seq" OWNED BY "public"."django_celery_beat_periodictask"."id";
            public       bfiknbgrtbqgnw    false    244            �            1259    2729661     django_celery_beat_periodictasks    TABLE     �   CREATE TABLE "public"."django_celery_beat_periodictasks" (
    "ident" smallint NOT NULL,
    "last_update" timestamp with time zone NOT NULL
);
 8   DROP TABLE "public"."django_celery_beat_periodictasks";
       public         bfiknbgrtbqgnw    false            �            1259    2729681     django_celery_beat_solarschedule    TABLE     �   CREATE TABLE "public"."django_celery_beat_solarschedule" (
    "id" integer NOT NULL,
    "event" character varying(24) NOT NULL,
    "latitude" numeric(9,6) NOT NULL,
    "longitude" numeric(9,6) NOT NULL
);
 8   DROP TABLE "public"."django_celery_beat_solarschedule";
       public         bfiknbgrtbqgnw    false            �            1259    2729679 '   django_celery_beat_solarschedule_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_celery_beat_solarschedule_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE "public"."django_celery_beat_solarschedule_id_seq";
       public       bfiknbgrtbqgnw    false    248            �           0    0 '   django_celery_beat_solarschedule_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE "public"."django_celery_beat_solarschedule_id_seq" OWNED BY "public"."django_celery_beat_solarschedule"."id";
            public       bfiknbgrtbqgnw    false    247            �            1259    2729703     django_celery_results_taskresult    TABLE       CREATE TABLE "public"."django_celery_results_taskresult" (
    "id" integer NOT NULL,
    "task_id" character varying(255) NOT NULL,
    "status" character varying(50) NOT NULL,
    "content_type" character varying(128) NOT NULL,
    "content_encoding" character varying(64) NOT NULL,
    "result" "text",
    "date_done" timestamp with time zone NOT NULL,
    "traceback" "text",
    "hidden" boolean NOT NULL,
    "meta" "text",
    "task_args" "text",
    "task_kwargs" "text",
    "task_name" character varying(255)
);
 8   DROP TABLE "public"."django_celery_results_taskresult";
       public         bfiknbgrtbqgnw    false            �            1259    2729701 '   django_celery_results_taskresult_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_celery_results_taskresult_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE "public"."django_celery_results_taskresult_id_seq";
       public       bfiknbgrtbqgnw    false    250            �           0    0 '   django_celery_results_taskresult_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE "public"."django_celery_results_taskresult_id_seq" OWNED BY "public"."django_celery_results_taskresult"."id";
            public       bfiknbgrtbqgnw    false    249            �            1259    2729140    django_content_type    TABLE     �   CREATE TABLE "public"."django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);
 +   DROP TABLE "public"."django_content_type";
       public         bfiknbgrtbqgnw    false            �            1259    2729138    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_content_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "public"."django_content_type_id_seq";
       public       bfiknbgrtbqgnw    false    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "public"."django_content_type_id_seq" OWNED BY "public"."django_content_type"."id";
            public       bfiknbgrtbqgnw    false    198            �            1259    2729129    django_migrations    TABLE     �   CREATE TABLE "public"."django_migrations" (
    "id" integer NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);
 )   DROP TABLE "public"."django_migrations";
       public         bfiknbgrtbqgnw    false            �            1259    2729127    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."django_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "public"."django_migrations_id_seq";
       public       bfiknbgrtbqgnw    false    197            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "public"."django_migrations_id_seq" OWNED BY "public"."django_migrations"."id";
            public       bfiknbgrtbqgnw    false    196            �            1259    2729716    django_session    TABLE     �   CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);
 &   DROP TABLE "public"."django_session";
       public         bfiknbgrtbqgnw    false            1           2604    2729257    alumno_alumno id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_alumno" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_alumno_id_seq"'::"regclass");
 E   ALTER TABLE "public"."alumno_alumno" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    212    213    213            =           2604    2729392    alumno_directordepartamento id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_directordepartamento_id_seq"'::"regclass");
 S   ALTER TABLE "public"."alumno_directordepartamento" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    236    237    237            3           2604    2729286    alumno_empresa id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_empresa" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_empresa_id_seq"'::"regclass");
 F   ALTER TABLE "public"."alumno_empresa" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    217    218    218            4           2604    2729299    alumno_entrevista id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_entrevista" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_entrevista_id_seq"'::"regclass");
 I   ALTER TABLE "public"."alumno_entrevista" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    220    219    220            :           2604    2729366    alumno_pasantia id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_pasantia" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_pasantia_id_seq"'::"regclass");
 G   ALTER TABLE "public"."alumno_pasantia" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    233    232    233            <           2604    2729382    alumno_postulacion id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_postulacion" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_postulacion_id_seq"'::"regclass");
 J   ALTER TABLE "public"."alumno_postulacion" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    235    234    235            9           2604    2729355    alumno_puesto puesto_id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_puesto" ALTER COLUMN "puesto_id" SET DEFAULT "nextval"('"public"."alumno_puesto_puesto_id_seq"'::"regclass");
 L   ALTER TABLE "public"."alumno_puesto" ALTER COLUMN "puesto_id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    231    230    231            7           2604    2729335    alumno_subcomisioncarrera id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_subcomisioncarrera_id_seq"'::"regclass");
 Q   ALTER TABLE "public"."alumno_subcomisioncarrera" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    227    226    227            8           2604    2729347 %   alumno_subcomisioncarrera_docentes id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_subcomisioncarrera_docentes_id_seq"'::"regclass");
 Z   ALTER TABLE "public"."alumno_subcomisioncarrera_docentes" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    229    228    229            5           2604    2729315 !   alumno_subcomisionpasantiaspps id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_subcomisionpasantiaspps_id_seq"'::"regclass");
 V   ALTER TABLE "public"."alumno_subcomisionpasantiaspps" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    222    223    223            6           2604    2729327 *   alumno_subcomisionpasantiaspps_docentes id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_subcomisionpasantiaspps_docentes_id_seq"'::"regclass");
 _   ALTER TABLE "public"."alumno_subcomisionpasantiaspps_docentes" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    224    225    225            .           2604    2729228    alumno_user id    DEFAULT     ~   ALTER TABLE ONLY "public"."alumno_user" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_user_id_seq"'::"regclass");
 C   ALTER TABLE "public"."alumno_user" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    207    206    207            /           2604    2729241    alumno_user_groups id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_user_groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_user_groups_id_seq"'::"regclass");
 J   ALTER TABLE "public"."alumno_user_groups" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    208    209    209            0           2604    2729249    alumno_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY "public"."alumno_user_user_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."alumno_user_user_permissions_id_seq"'::"regclass");
 T   ALTER TABLE "public"."alumno_user_user_permissions" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    210    211    211            ,           2604    2729184    auth_group id    DEFAULT     |   ALTER TABLE ONLY "public"."auth_group" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_group_id_seq"'::"regclass");
 B   ALTER TABLE "public"."auth_group" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    203    202    203            -           2604    2729194    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY "public"."auth_group_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_group_permissions_id_seq"'::"regclass");
 N   ALTER TABLE "public"."auth_group_permissions" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    205    204    205            +           2604    2729176    auth_permission id    DEFAULT     �   ALTER TABLE ONLY "public"."auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_permission_id_seq"'::"regclass");
 G   ALTER TABLE "public"."auth_permission" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    201    200    201            >           2604    2729612    django_admin_log id    DEFAULT     �   ALTER TABLE ONLY "public"."django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_admin_log_id_seq"'::"regclass");
 H   ALTER TABLE "public"."django_admin_log" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    239    238    239            @           2604    2729636 %   django_celery_beat_crontabschedule id    DEFAULT     �   ALTER TABLE ONLY "public"."django_celery_beat_crontabschedule" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_celery_beat_crontabschedule_id_seq"'::"regclass");
 Z   ALTER TABLE "public"."django_celery_beat_crontabschedule" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    241    240    241            A           2604    2729644 &   django_celery_beat_intervalschedule id    DEFAULT     �   ALTER TABLE ONLY "public"."django_celery_beat_intervalschedule" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_celery_beat_intervalschedule_id_seq"'::"regclass");
 [   ALTER TABLE "public"."django_celery_beat_intervalschedule" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    242    243    243            B           2604    2729652 "   django_celery_beat_periodictask id    DEFAULT     �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_celery_beat_periodictask_id_seq"'::"regclass");
 W   ALTER TABLE "public"."django_celery_beat_periodictask" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    244    245    245            E           2604    2729684 #   django_celery_beat_solarschedule id    DEFAULT     �   ALTER TABLE ONLY "public"."django_celery_beat_solarschedule" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_celery_beat_solarschedule_id_seq"'::"regclass");
 X   ALTER TABLE "public"."django_celery_beat_solarschedule" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    248    247    248            F           2604    2729706 #   django_celery_results_taskresult id    DEFAULT     �   ALTER TABLE ONLY "public"."django_celery_results_taskresult" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_celery_results_taskresult_id_seq"'::"regclass");
 X   ALTER TABLE "public"."django_celery_results_taskresult" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    250    249    250            *           2604    2729143    django_content_type id    DEFAULT     �   ALTER TABLE ONLY "public"."django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_content_type_id_seq"'::"regclass");
 K   ALTER TABLE "public"."django_content_type" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    198    199    199            )           2604    2729132    django_migrations id    DEFAULT     �   ALTER TABLE ONLY "public"."django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_migrations_id_seq"'::"regclass");
 I   ALTER TABLE "public"."django_migrations" ALTER COLUMN "id" DROP DEFAULT;
       public       bfiknbgrtbqgnw    false    197    196    197            �          0    2729254    alumno_alumno 
   TABLE DATA               �  COPY "public"."alumno_alumno" ("id", "numero_registro", "curriculum", "plan_de_estudio", "historia_academica", "descripcion_intereses", "descripcion_habilidades", "ultima_actualizacion_perfil", "ultima_postulacion", "condicion_acreditacion", "expedicion_acreditacion", "comentarios_comision_carrera", "comentarios_carrera_visibles", "comentarios_comision_pps", "perfil", "progreso", "carrera_id", "user_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    213            �          0    2729266    alumno_carrera 
   TABLE DATA               I   COPY "public"."alumno_carrera" ("nombre", "departamento_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    214            �          0    2729271    alumno_departamento 
   TABLE DATA               ;   COPY "public"."alumno_departamento" ("nombre") FROM stdin;
    public       bfiknbgrtbqgnw    false    215            �          0    2729389    alumno_directordepartamento 
   TABLE DATA               `   COPY "public"."alumno_directordepartamento" ("id", "departamento_id", "docente_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    237            �          0    2729276    alumno_docente 
   TABLE DATA               m   COPY "public"."alumno_docente" ("nombre", "apellido", "email", "box_oficina", "departamento_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    216            �          0    2729283    alumno_empresa 
   TABLE DATA               �   COPY "public"."alumno_empresa" ("id", "descripcion", "url", "logo", "nombre_fantasia", "departamento_id", "user_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    218            �          0    2729296    alumno_entrevista 
   TABLE DATA               �   COPY "public"."alumno_entrevista" ("id", "fecha", "lugar", "resultado", "pasantia_aceptada", "comentarios_empresa", "comentarios_comision_pps", "status", "alumno_id", "empresa_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    220            �          0    2729363    alumno_pasantia 
   TABLE DATA               �   COPY "public"."alumno_pasantia" ("id", "fecha_inicio", "fecha_fin", "informe", "numero_legajo", "comentarios_empresa", "comentarios_comision_pps", "entrevista_id", "tutor_docente_id", "tutor_empresa_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    233            �          0    2729379    alumno_postulacion 
   TABLE DATA               �   COPY "public"."alumno_postulacion" ("id", "fecha", "fecha_desestimacion", "activa", "alumno_id", "entrevista_id", "puesto_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    235            �          0    2729352    alumno_puesto 
   TABLE DATA               �   COPY "public"."alumno_puesto" ("puesto_id", "nombre", "descripcion_actividades", "conocimientos_requeridos", "horario", "rentado", "activo", "empresa_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    231            �          0    2729332    alumno_subcomisioncarrera 
   TABLE DATA               V   COPY "public"."alumno_subcomisioncarrera" ("id", "carrera_id", "user_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    227            �          0    2729344 "   alumno_subcomisioncarrera_docentes 
   TABLE DATA               m   COPY "public"."alumno_subcomisioncarrera_docentes" ("id", "subcomisioncarrera_id", "docente_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    229            �          0    2729312    alumno_subcomisionpasantiaspps 
   TABLE DATA               `   COPY "public"."alumno_subcomisionpasantiaspps" ("id", "departamento_id", "user_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    223            �          0    2729324 '   alumno_subcomisionpasantiaspps_docentes 
   TABLE DATA               w   COPY "public"."alumno_subcomisionpasantiaspps_docentes" ("id", "subcomisionpasantiaspps_id", "docente_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    225            �          0    2729305    alumno_tutorempresa 
   TABLE DATA               f   COPY "public"."alumno_tutorempresa" ("nombre", "apellido", "cargo", "mail", "empresa_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    221            �          0    2729225    alumno_user 
   TABLE DATA               �   COPY "public"."alumno_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined", "tipo") FROM stdin;
    public       bfiknbgrtbqgnw    false    207            �          0    2729238    alumno_user_groups 
   TABLE DATA               M   COPY "public"."alumno_user_groups" ("id", "user_id", "group_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    209            �          0    2729246    alumno_user_user_permissions 
   TABLE DATA               \   COPY "public"."alumno_user_user_permissions" ("id", "user_id", "permission_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    211            �          0    2729181 
   auth_group 
   TABLE DATA               6   COPY "public"."auth_group" ("id", "name") FROM stdin;
    public       bfiknbgrtbqgnw    false    203            �          0    2729191    auth_group_permissions 
   TABLE DATA               W   COPY "public"."auth_group_permissions" ("id", "group_id", "permission_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    205            �          0    2729173    auth_permission 
   TABLE DATA               Z   COPY "public"."auth_permission" ("id", "name", "content_type_id", "codename") FROM stdin;
    public       bfiknbgrtbqgnw    false    201            �          0    2729609    django_admin_log 
   TABLE DATA               �   COPY "public"."django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") FROM stdin;
    public       bfiknbgrtbqgnw    false    239            �          0    2729633 "   django_celery_beat_crontabschedule 
   TABLE DATA               �   COPY "public"."django_celery_beat_crontabschedule" ("id", "minute", "hour", "day_of_week", "day_of_month", "month_of_year", "timezone") FROM stdin;
    public       bfiknbgrtbqgnw    false    241            �          0    2729641 #   django_celery_beat_intervalschedule 
   TABLE DATA               Z   COPY "public"."django_celery_beat_intervalschedule" ("id", "every", "period") FROM stdin;
    public       bfiknbgrtbqgnw    false    243            �          0    2729649    django_celery_beat_periodictask 
   TABLE DATA               .  COPY "public"."django_celery_beat_periodictask" ("id", "name", "task", "args", "kwargs", "queue", "exchange", "routing_key", "expires", "enabled", "last_run_at", "total_run_count", "date_changed", "description", "crontab_id", "interval_id", "solar_id", "one_off", "start_time", "priority") FROM stdin;
    public       bfiknbgrtbqgnw    false    245            �          0    2729661     django_celery_beat_periodictasks 
   TABLE DATA               V   COPY "public"."django_celery_beat_periodictasks" ("ident", "last_update") FROM stdin;
    public       bfiknbgrtbqgnw    false    246            �          0    2729681     django_celery_beat_solarschedule 
   TABLE DATA               f   COPY "public"."django_celery_beat_solarschedule" ("id", "event", "latitude", "longitude") FROM stdin;
    public       bfiknbgrtbqgnw    false    248            �          0    2729703     django_celery_results_taskresult 
   TABLE DATA               �   COPY "public"."django_celery_results_taskresult" ("id", "task_id", "status", "content_type", "content_encoding", "result", "date_done", "traceback", "hidden", "meta", "task_args", "task_kwargs", "task_name") FROM stdin;
    public       bfiknbgrtbqgnw    false    250            �          0    2729140    django_content_type 
   TABLE DATA               M   COPY "public"."django_content_type" ("id", "app_label", "model") FROM stdin;
    public       bfiknbgrtbqgnw    false    199            �          0    2729129    django_migrations 
   TABLE DATA               O   COPY "public"."django_migrations" ("id", "app", "name", "applied") FROM stdin;
    public       bfiknbgrtbqgnw    false    197            �          0    2729716    django_session 
   TABLE DATA               Z   COPY "public"."django_session" ("session_key", "session_data", "expire_date") FROM stdin;
    public       bfiknbgrtbqgnw    false    251            �           0    0    alumno_alumno_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('"public"."alumno_alumno_id_seq"', 29, true);
            public       bfiknbgrtbqgnw    false    212            �           0    0 "   alumno_directordepartamento_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"public"."alumno_directordepartamento_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    236            �           0    0    alumno_empresa_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"public"."alumno_empresa_id_seq"', 14, true);
            public       bfiknbgrtbqgnw    false    217            �           0    0    alumno_entrevista_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"public"."alumno_entrevista_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    219            �           0    0    alumno_pasantia_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"public"."alumno_pasantia_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    232            �           0    0    alumno_postulacion_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"public"."alumno_postulacion_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    234            �           0    0    alumno_puesto_puesto_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"public"."alumno_puesto_puesto_id_seq"', 1, true);
            public       bfiknbgrtbqgnw    false    230            �           0    0 )   alumno_subcomisioncarrera_docentes_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('"public"."alumno_subcomisioncarrera_docentes_id_seq"', 3, true);
            public       bfiknbgrtbqgnw    false    228            �           0    0     alumno_subcomisioncarrera_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('"public"."alumno_subcomisioncarrera_id_seq"', 1, true);
            public       bfiknbgrtbqgnw    false    226            �           0    0 .   alumno_subcomisionpasantiaspps_docentes_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('"public"."alumno_subcomisionpasantiaspps_docentes_id_seq"', 1, true);
            public       bfiknbgrtbqgnw    false    224            �           0    0 %   alumno_subcomisionpasantiaspps_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"public"."alumno_subcomisionpasantiaspps_id_seq"', 1, true);
            public       bfiknbgrtbqgnw    false    222            �           0    0    alumno_user_groups_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"public"."alumno_user_groups_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    208            �           0    0    alumno_user_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"public"."alumno_user_id_seq"', 47, true);
            public       bfiknbgrtbqgnw    false    206            �           0    0 #   alumno_user_user_permissions_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"public"."alumno_user_user_permissions_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    210            �           0    0    auth_group_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"public"."auth_group_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"public"."auth_group_permissions_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"public"."auth_permission_id_seq"', 100, true);
            public       bfiknbgrtbqgnw    false    200            �           0    0    django_admin_log_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"public"."django_admin_log_id_seq"', 136, true);
            public       bfiknbgrtbqgnw    false    238            �           0    0 )   django_celery_beat_crontabschedule_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('"public"."django_celery_beat_crontabschedule_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    240            �           0    0 *   django_celery_beat_intervalschedule_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('"public"."django_celery_beat_intervalschedule_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    242            �           0    0 &   django_celery_beat_periodictask_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('"public"."django_celery_beat_periodictask_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    244            �           0    0 '   django_celery_beat_solarschedule_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('"public"."django_celery_beat_solarschedule_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    247            �           0    0 '   django_celery_results_taskresult_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('"public"."django_celery_results_taskresult_id_seq"', 1, false);
            public       bfiknbgrtbqgnw    false    249                        0    0    django_content_type_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"public"."django_content_type_id_seq"', 25, true);
            public       bfiknbgrtbqgnw    false    198                       0    0    django_migrations_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"public"."django_migrations_id_seq"', 34, true);
            public       bfiknbgrtbqgnw    false    196            q           2606    2729265 /   alumno_alumno alumno_alumno_numero_registro_key 
   CONSTRAINT     }   ALTER TABLE ONLY "public"."alumno_alumno"
    ADD CONSTRAINT "alumno_alumno_numero_registro_key" UNIQUE ("numero_registro");
 _   ALTER TABLE ONLY "public"."alumno_alumno" DROP CONSTRAINT "alumno_alumno_numero_registro_key";
       public         bfiknbgrtbqgnw    false    213            s           2606    2729263     alumno_alumno alumno_alumno_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."alumno_alumno"
    ADD CONSTRAINT "alumno_alumno_pkey" PRIMARY KEY ("id");
 P   ALTER TABLE ONLY "public"."alumno_alumno" DROP CONSTRAINT "alumno_alumno_pkey";
       public         bfiknbgrtbqgnw    false    213            u           2606    2729376 '   alumno_alumno alumno_alumno_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY "public"."alumno_alumno"
    ADD CONSTRAINT "alumno_alumno_user_id_key" UNIQUE ("user_id");
 W   ALTER TABLE ONLY "public"."alumno_alumno" DROP CONSTRAINT "alumno_alumno_user_id_key";
       public         bfiknbgrtbqgnw    false    213            y           2606    2729400 B   alumno_carrera alumno_carrera_departamento_id_nombre_d3e76cfd_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_carrera"
    ADD CONSTRAINT "alumno_carrera_departamento_id_nombre_d3e76cfd_uniq" UNIQUE ("departamento_id", "nombre");
 r   ALTER TABLE ONLY "public"."alumno_carrera" DROP CONSTRAINT "alumno_carrera_departamento_id_nombre_d3e76cfd_uniq";
       public         bfiknbgrtbqgnw    false    214    214            |           2606    2729270 "   alumno_carrera alumno_carrera_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."alumno_carrera"
    ADD CONSTRAINT "alumno_carrera_pkey" PRIMARY KEY ("nombre");
 R   ALTER TABLE ONLY "public"."alumno_carrera" DROP CONSTRAINT "alumno_carrera_pkey";
       public         bfiknbgrtbqgnw    false    214                       2606    2729275 ,   alumno_departamento alumno_departamento_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY "public"."alumno_departamento"
    ADD CONSTRAINT "alumno_departamento_pkey" PRIMARY KEY ("nombre");
 \   ALTER TABLE ONLY "public"."alumno_departamento" DROP CONSTRAINT "alumno_departamento_pkey";
       public         bfiknbgrtbqgnw    false    215            �           2606    2729604 [   alumno_directordepartamento alumno_directordepartame_departamento_id_docente__dc031f05_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepartame_departamento_id_docente__dc031f05_uniq" UNIQUE ("departamento_id", "docente_id");
 �   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepartame_departamento_id_docente__dc031f05_uniq";
       public         bfiknbgrtbqgnw    false    237    237            �           2606    2729396 K   alumno_directordepartamento alumno_directordepartamento_departamento_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepartamento_departamento_id_key" UNIQUE ("departamento_id");
 {   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepartamento_departamento_id_key";
       public         bfiknbgrtbqgnw    false    237            �           2606    2729398 F   alumno_directordepartamento alumno_directordepartamento_docente_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepartamento_docente_id_key" UNIQUE ("docente_id");
 v   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepartamento_docente_id_key";
       public         bfiknbgrtbqgnw    false    237            �           2606    2729394 <   alumno_directordepartamento alumno_directordepartamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepartamento_pkey" PRIMARY KEY ("id");
 l   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepartamento_pkey";
       public         bfiknbgrtbqgnw    false    237            �           2606    2729280 "   alumno_docente alumno_docente_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "public"."alumno_docente"
    ADD CONSTRAINT "alumno_docente_pkey" PRIMARY KEY ("email");
 R   ALTER TABLE ONLY "public"."alumno_docente" DROP CONSTRAINT "alumno_docente_pkey";
       public         bfiknbgrtbqgnw    false    216            �           2606    2729451 K   alumno_empresa alumno_empresa_departamento_id_nombre_fantasia_b76d5106_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_empresa"
    ADD CONSTRAINT "alumno_empresa_departamento_id_nombre_fantasia_b76d5106_uniq" UNIQUE ("departamento_id", "nombre_fantasia");
 {   ALTER TABLE ONLY "public"."alumno_empresa" DROP CONSTRAINT "alumno_empresa_departamento_id_nombre_fantasia_b76d5106_uniq";
       public         bfiknbgrtbqgnw    false    218    218            �           2606    2729291 "   alumno_empresa alumno_empresa_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "public"."alumno_empresa"
    ADD CONSTRAINT "alumno_empresa_pkey" PRIMARY KEY ("id");
 R   ALTER TABLE ONLY "public"."alumno_empresa" DROP CONSTRAINT "alumno_empresa_pkey";
       public         bfiknbgrtbqgnw    false    218            �           2606    2729293 )   alumno_empresa alumno_empresa_user_id_key 
   CONSTRAINT     o   ALTER TABLE ONLY "public"."alumno_empresa"
    ADD CONSTRAINT "alumno_empresa_user_id_key" UNIQUE ("user_id");
 Y   ALTER TABLE ONLY "public"."alumno_empresa" DROP CONSTRAINT "alumno_empresa_user_id_key";
       public         bfiknbgrtbqgnw    false    218            �           2606    2729465 L   alumno_entrevista alumno_entrevista_alumno_id_empresa_id_fecha_57d68c85_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_entrevista"
    ADD CONSTRAINT "alumno_entrevista_alumno_id_empresa_id_fecha_57d68c85_uniq" UNIQUE ("alumno_id", "empresa_id", "fecha");
 |   ALTER TABLE ONLY "public"."alumno_entrevista" DROP CONSTRAINT "alumno_entrevista_alumno_id_empresa_id_fecha_57d68c85_uniq";
       public         bfiknbgrtbqgnw    false    220    220    220            �           2606    2729304 (   alumno_entrevista alumno_entrevista_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY "public"."alumno_entrevista"
    ADD CONSTRAINT "alumno_entrevista_pkey" PRIMARY KEY ("id");
 X   ALTER TABLE ONLY "public"."alumno_entrevista" DROP CONSTRAINT "alumno_entrevista_pkey";
       public         bfiknbgrtbqgnw    false    220            �           2606    2729374 1   alumno_pasantia alumno_pasantia_numero_legajo_key 
   CONSTRAINT     }   ALTER TABLE ONLY "public"."alumno_pasantia"
    ADD CONSTRAINT "alumno_pasantia_numero_legajo_key" UNIQUE ("numero_legajo");
 a   ALTER TABLE ONLY "public"."alumno_pasantia" DROP CONSTRAINT "alumno_pasantia_numero_legajo_key";
       public         bfiknbgrtbqgnw    false    233            �           2606    2729372 $   alumno_pasantia alumno_pasantia_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "public"."alumno_pasantia"
    ADD CONSTRAINT "alumno_pasantia_pkey" PRIMARY KEY ("id");
 T   ALTER TABLE ONLY "public"."alumno_pasantia" DROP CONSTRAINT "alumno_pasantia_pkey";
       public         bfiknbgrtbqgnw    false    233            �           2606    2729386 7   alumno_postulacion alumno_postulacion_entrevista_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_entrevista_id_key" UNIQUE ("entrevista_id");
 g   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_entrevista_id_key";
       public         bfiknbgrtbqgnw    false    235            �           2606    2729384 *   alumno_postulacion alumno_postulacion_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_pkey" PRIMARY KEY ("id");
 Z   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_pkey";
       public         bfiknbgrtbqgnw    false    235            �           2606    2729590 G   alumno_postulacion alumno_postulacion_puesto_id_alumno_id_0f8fc76c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_puesto_id_alumno_id_0f8fc76c_uniq" UNIQUE ("puesto_id", "alumno_id");
 w   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_puesto_id_alumno_id_0f8fc76c_uniq";
       public         bfiknbgrtbqgnw    false    235    235            �           2606    2729533 ;   alumno_puesto alumno_puesto_empresa_id_nombre_8f9c006f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_puesto"
    ADD CONSTRAINT "alumno_puesto_empresa_id_nombre_8f9c006f_uniq" UNIQUE ("empresa_id", "nombre");
 k   ALTER TABLE ONLY "public"."alumno_puesto" DROP CONSTRAINT "alumno_puesto_empresa_id_nombre_8f9c006f_uniq";
       public         bfiknbgrtbqgnw    false    231    231            �           2606    2729360     alumno_puesto alumno_puesto_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "public"."alumno_puesto"
    ADD CONSTRAINT "alumno_puesto_pkey" PRIMARY KEY ("puesto_id");
 P   ALTER TABLE ONLY "public"."alumno_puesto" DROP CONSTRAINT "alumno_puesto_pkey";
       public         bfiknbgrtbqgnw    false    231            �           2606    2729523 b   alumno_subcomisioncarrera_docentes alumno_subcomisioncarrer_subcomisioncarrera_id_do_bd35e735_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes"
    ADD CONSTRAINT "alumno_subcomisioncarrer_subcomisioncarrera_id_do_bd35e735_uniq" UNIQUE ("subcomisioncarrera_id", "docente_id");
 �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes" DROP CONSTRAINT "alumno_subcomisioncarrer_subcomisioncarrera_id_do_bd35e735_uniq";
       public         bfiknbgrtbqgnw    false    229    229            �           2606    2729339 B   alumno_subcomisioncarrera alumno_subcomisioncarrera_carrera_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera"
    ADD CONSTRAINT "alumno_subcomisioncarrera_carrera_id_key" UNIQUE ("carrera_id");
 r   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" DROP CONSTRAINT "alumno_subcomisioncarrera_carrera_id_key";
       public         bfiknbgrtbqgnw    false    227            �           2606    2729349 J   alumno_subcomisioncarrera_docentes alumno_subcomisioncarrera_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes"
    ADD CONSTRAINT "alumno_subcomisioncarrera_docentes_pkey" PRIMARY KEY ("id");
 z   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes" DROP CONSTRAINT "alumno_subcomisioncarrera_docentes_pkey";
       public         bfiknbgrtbqgnw    false    229            �           2606    2729337 8   alumno_subcomisioncarrera alumno_subcomisioncarrera_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera"
    ADD CONSTRAINT "alumno_subcomisioncarrera_pkey" PRIMARY KEY ("id");
 h   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" DROP CONSTRAINT "alumno_subcomisioncarrera_pkey";
       public         bfiknbgrtbqgnw    false    227            �           2606    2729341 ?   alumno_subcomisioncarrera alumno_subcomisioncarrera_user_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera"
    ADD CONSTRAINT "alumno_subcomisioncarrera_user_id_key" UNIQUE ("user_id");
 o   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" DROP CONSTRAINT "alumno_subcomisioncarrera_user_id_key";
       public         bfiknbgrtbqgnw    false    227            �           2606    2729497 g   alumno_subcomisionpasantiaspps_docentes alumno_subcomisionpasant_subcomisionpasantiaspps__91b318b5_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes"
    ADD CONSTRAINT "alumno_subcomisionpasant_subcomisionpasantiaspps__91b318b5_uniq" UNIQUE ("subcomisionpasantiaspps_id", "docente_id");
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes" DROP CONSTRAINT "alumno_subcomisionpasant_subcomisionpasantiaspps__91b318b5_uniq";
       public         bfiknbgrtbqgnw    false    225    225            �           2606    2729319 Q   alumno_subcomisionpasantiaspps alumno_subcomisionpasantiaspps_departamento_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps"
    ADD CONSTRAINT "alumno_subcomisionpasantiaspps_departamento_id_key" UNIQUE ("departamento_id");
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" DROP CONSTRAINT "alumno_subcomisionpasantiaspps_departamento_id_key";
       public         bfiknbgrtbqgnw    false    223            �           2606    2729329 T   alumno_subcomisionpasantiaspps_docentes alumno_subcomisionpasantiaspps_docentes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes"
    ADD CONSTRAINT "alumno_subcomisionpasantiaspps_docentes_pkey" PRIMARY KEY ("id");
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes" DROP CONSTRAINT "alumno_subcomisionpasantiaspps_docentes_pkey";
       public         bfiknbgrtbqgnw    false    225            �           2606    2729317 B   alumno_subcomisionpasantiaspps alumno_subcomisionpasantiaspps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps"
    ADD CONSTRAINT "alumno_subcomisionpasantiaspps_pkey" PRIMARY KEY ("id");
 r   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" DROP CONSTRAINT "alumno_subcomisionpasantiaspps_pkey";
       public         bfiknbgrtbqgnw    false    223            �           2606    2729321 I   alumno_subcomisionpasantiaspps alumno_subcomisionpasantiaspps_user_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps"
    ADD CONSTRAINT "alumno_subcomisionpasantiaspps_user_id_key" UNIQUE ("user_id");
 y   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" DROP CONSTRAINT "alumno_subcomisionpasantiaspps_user_id_key";
       public         bfiknbgrtbqgnw    false    223            �           2606    2729309 ,   alumno_tutorempresa alumno_tutorempresa_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "public"."alumno_tutorempresa"
    ADD CONSTRAINT "alumno_tutorempresa_pkey" PRIMARY KEY ("mail");
 \   ALTER TABLE ONLY "public"."alumno_tutorempresa" DROP CONSTRAINT "alumno_tutorempresa_pkey";
       public         bfiknbgrtbqgnw    false    221            d           2606    2729243 *   alumno_user_groups alumno_user_groups_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY "public"."alumno_user_groups"
    ADD CONSTRAINT "alumno_user_groups_pkey" PRIMARY KEY ("id");
 Z   ALTER TABLE ONLY "public"."alumno_user_groups" DROP CONSTRAINT "alumno_user_groups_pkey";
       public         bfiknbgrtbqgnw    false    209            g           2606    2729413 D   alumno_user_groups alumno_user_groups_user_id_group_id_795cb1a7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_groups"
    ADD CONSTRAINT "alumno_user_groups_user_id_group_id_795cb1a7_uniq" UNIQUE ("user_id", "group_id");
 t   ALTER TABLE ONLY "public"."alumno_user_groups" DROP CONSTRAINT "alumno_user_groups_user_id_group_id_795cb1a7_uniq";
       public         bfiknbgrtbqgnw    false    209    209            ^           2606    2729233    alumno_user alumno_user_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "public"."alumno_user"
    ADD CONSTRAINT "alumno_user_pkey" PRIMARY KEY ("id");
 L   ALTER TABLE ONLY "public"."alumno_user" DROP CONSTRAINT "alumno_user_pkey";
       public         bfiknbgrtbqgnw    false    207            i           2606    2729427 Y   alumno_user_user_permissions alumno_user_user_permiss_user_id_permission_id_0722545d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_user_permissions"
    ADD CONSTRAINT "alumno_user_user_permiss_user_id_permission_id_0722545d_uniq" UNIQUE ("user_id", "permission_id");
 �   ALTER TABLE ONLY "public"."alumno_user_user_permissions" DROP CONSTRAINT "alumno_user_user_permiss_user_id_permission_id_0722545d_uniq";
       public         bfiknbgrtbqgnw    false    211    211            l           2606    2729251 >   alumno_user_user_permissions alumno_user_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_user_permissions"
    ADD CONSTRAINT "alumno_user_user_permissions_pkey" PRIMARY KEY ("id");
 n   ALTER TABLE ONLY "public"."alumno_user_user_permissions" DROP CONSTRAINT "alumno_user_user_permissions_pkey";
       public         bfiknbgrtbqgnw    false    211            a           2606    2729235 $   alumno_user alumno_user_username_key 
   CONSTRAINT     k   ALTER TABLE ONLY "public"."alumno_user"
    ADD CONSTRAINT "alumno_user_username_key" UNIQUE ("username");
 T   ALTER TABLE ONLY "public"."alumno_user" DROP CONSTRAINT "alumno_user_username_key";
       public         bfiknbgrtbqgnw    false    207            T           2606    2729221    auth_group auth_group_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name");
 N   ALTER TABLE ONLY "public"."auth_group" DROP CONSTRAINT "auth_group_name_key";
       public         bfiknbgrtbqgnw    false    203            Y           2606    2729217 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id");
 �   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
       public         bfiknbgrtbqgnw    false    205    205            \           2606    2729196 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id");
 b   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_pkey";
       public         bfiknbgrtbqgnw    false    205            V           2606    2729186    auth_group auth_group_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id");
 J   ALTER TABLE ONLY "public"."auth_group" DROP CONSTRAINT "auth_group_pkey";
       public         bfiknbgrtbqgnw    false    203            O           2606    2729203 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename");
 v   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq";
       public         bfiknbgrtbqgnw    false    201    201            Q           2606    2729178 $   auth_permission auth_permission_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");
 T   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_pkey";
       public         bfiknbgrtbqgnw    false    201            �           2606    2729618 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");
 V   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_pkey";
       public         bfiknbgrtbqgnw    false    239            �           2606    2729638 J   django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_crontabschedule"
    ADD CONSTRAINT "django_celery_beat_crontabschedule_pkey" PRIMARY KEY ("id");
 z   ALTER TABLE ONLY "public"."django_celery_beat_crontabschedule" DROP CONSTRAINT "django_celery_beat_crontabschedule_pkey";
       public         bfiknbgrtbqgnw    false    241            �           2606    2729646 L   django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_intervalschedule"
    ADD CONSTRAINT "django_celery_beat_intervalschedule_pkey" PRIMARY KEY ("id");
 |   ALTER TABLE ONLY "public"."django_celery_beat_intervalschedule" DROP CONSTRAINT "django_celery_beat_intervalschedule_pkey";
       public         bfiknbgrtbqgnw    false    243            �           2606    2729660 H   django_celery_beat_periodictask django_celery_beat_periodictask_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask"
    ADD CONSTRAINT "django_celery_beat_periodictask_name_key" UNIQUE ("name");
 x   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" DROP CONSTRAINT "django_celery_beat_periodictask_name_key";
       public         bfiknbgrtbqgnw    false    245            �           2606    2729658 D   django_celery_beat_periodictask django_celery_beat_periodictask_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask"
    ADD CONSTRAINT "django_celery_beat_periodictask_pkey" PRIMARY KEY ("id");
 t   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" DROP CONSTRAINT "django_celery_beat_periodictask_pkey";
       public         bfiknbgrtbqgnw    false    245            �           2606    2729665 F   django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_periodictasks"
    ADD CONSTRAINT "django_celery_beat_periodictasks_pkey" PRIMARY KEY ("ident");
 v   ALTER TABLE ONLY "public"."django_celery_beat_periodictasks" DROP CONSTRAINT "django_celery_beat_periodictasks_pkey";
       public         bfiknbgrtbqgnw    false    246            �           2606    2729694 `   django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_solarschedule"
    ADD CONSTRAINT "django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq" UNIQUE ("event", "latitude", "longitude");
 �   ALTER TABLE ONLY "public"."django_celery_beat_solarschedule" DROP CONSTRAINT "django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq";
       public         bfiknbgrtbqgnw    false    248    248    248            �           2606    2729686 F   django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_solarschedule"
    ADD CONSTRAINT "django_celery_beat_solarschedule_pkey" PRIMARY KEY ("id");
 v   ALTER TABLE ONLY "public"."django_celery_beat_solarschedule" DROP CONSTRAINT "django_celery_beat_solarschedule_pkey";
       public         bfiknbgrtbqgnw    false    248            �           2606    2729711 F   django_celery_results_taskresult django_celery_results_taskresult_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_results_taskresult"
    ADD CONSTRAINT "django_celery_results_taskresult_pkey" PRIMARY KEY ("id");
 v   ALTER TABLE ONLY "public"."django_celery_results_taskresult" DROP CONSTRAINT "django_celery_results_taskresult_pkey";
       public         bfiknbgrtbqgnw    false    250            �           2606    2729713 M   django_celery_results_taskresult django_celery_results_taskresult_task_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_results_taskresult"
    ADD CONSTRAINT "django_celery_results_taskresult_task_id_key" UNIQUE ("task_id");
 }   ALTER TABLE ONLY "public"."django_celery_results_taskresult" DROP CONSTRAINT "django_celery_results_taskresult_task_id_key";
       public         bfiknbgrtbqgnw    false    250            J           2606    2729147 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model");
 u   ALTER TABLE ONLY "public"."django_content_type" DROP CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq";
       public         bfiknbgrtbqgnw    false    199    199            L           2606    2729145 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");
 \   ALTER TABLE ONLY "public"."django_content_type" DROP CONSTRAINT "django_content_type_pkey";
       public         bfiknbgrtbqgnw    false    199            H           2606    2729137 (   django_migrations django_migrations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY "public"."django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");
 X   ALTER TABLE ONLY "public"."django_migrations" DROP CONSTRAINT "django_migrations_pkey";
       public         bfiknbgrtbqgnw    false    197            �           2606    2729723 "   django_session django_session_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "public"."django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");
 R   ALTER TABLE ONLY "public"."django_session" DROP CONSTRAINT "django_session_pkey";
       public         bfiknbgrtbqgnw    false    251            n           1259    2729562 !   alumno_alumno_carrera_id_41131f15    INDEX     k   CREATE INDEX "alumno_alumno_carrera_id_41131f15" ON "public"."alumno_alumno" USING "btree" ("carrera_id");
 9   DROP INDEX "public"."alumno_alumno_carrera_id_41131f15";
       public         bfiknbgrtbqgnw    false    213            o           1259    2729563 &   alumno_alumno_carrera_id_41131f15_like    INDEX     �   CREATE INDEX "alumno_alumno_carrera_id_41131f15_like" ON "public"."alumno_alumno" USING "btree" ("carrera_id" "varchar_pattern_ops");
 >   DROP INDEX "public"."alumno_alumno_carrera_id_41131f15_like";
       public         bfiknbgrtbqgnw    false    213            v           1259    2729555 '   alumno_carrera_departamento_id_0050a97f    INDEX     w   CREATE INDEX "alumno_carrera_departamento_id_0050a97f" ON "public"."alumno_carrera" USING "btree" ("departamento_id");
 ?   DROP INDEX "public"."alumno_carrera_departamento_id_0050a97f";
       public         bfiknbgrtbqgnw    false    214            w           1259    2729556 ,   alumno_carrera_departamento_id_0050a97f_like    INDEX     �   CREATE INDEX "alumno_carrera_departamento_id_0050a97f_like" ON "public"."alumno_carrera" USING "btree" ("departamento_id" "varchar_pattern_ops");
 D   DROP INDEX "public"."alumno_carrera_departamento_id_0050a97f_like";
       public         bfiknbgrtbqgnw    false    214            z           1259    2729430 #   alumno_carrera_nombre_f6a13502_like    INDEX     �   CREATE INDEX "alumno_carrera_nombre_f6a13502_like" ON "public"."alumno_carrera" USING "btree" ("nombre" "varchar_pattern_ops");
 ;   DROP INDEX "public"."alumno_carrera_nombre_f6a13502_like";
       public         bfiknbgrtbqgnw    false    214            }           1259    2729431 (   alumno_departamento_nombre_1b3e7e25_like    INDEX     �   CREATE INDEX "alumno_departamento_nombre_1b3e7e25_like" ON "public"."alumno_departamento" USING "btree" ("nombre" "varchar_pattern_ops");
 @   DROP INDEX "public"."alumno_departamento_nombre_1b3e7e25_like";
       public         bfiknbgrtbqgnw    false    215            �           1259    2729605 9   alumno_directordepartamento_departamento_id_65af14d5_like    INDEX     �   CREATE INDEX "alumno_directordepartamento_departamento_id_65af14d5_like" ON "public"."alumno_directordepartamento" USING "btree" ("departamento_id" "varchar_pattern_ops");
 Q   DROP INDEX "public"."alumno_directordepartamento_departamento_id_65af14d5_like";
       public         bfiknbgrtbqgnw    false    237            �           1259    2729606 4   alumno_directordepartamento_docente_id_53302dee_like    INDEX     �   CREATE INDEX "alumno_directordepartamento_docente_id_53302dee_like" ON "public"."alumno_directordepartamento" USING "btree" ("docente_id" "varchar_pattern_ops");
 L   DROP INDEX "public"."alumno_directordepartamento_docente_id_53302dee_like";
       public         bfiknbgrtbqgnw    false    237            �           1259    2729438 '   alumno_docente_departamento_id_44da43af    INDEX     w   CREATE INDEX "alumno_docente_departamento_id_44da43af" ON "public"."alumno_docente" USING "btree" ("departamento_id");
 ?   DROP INDEX "public"."alumno_docente_departamento_id_44da43af";
       public         bfiknbgrtbqgnw    false    216            �           1259    2729439 ,   alumno_docente_departamento_id_44da43af_like    INDEX     �   CREATE INDEX "alumno_docente_departamento_id_44da43af_like" ON "public"."alumno_docente" USING "btree" ("departamento_id" "varchar_pattern_ops");
 D   DROP INDEX "public"."alumno_docente_departamento_id_44da43af_like";
       public         bfiknbgrtbqgnw    false    216            �           1259    2729437 "   alumno_docente_email_b39bdc68_like    INDEX     ~   CREATE INDEX "alumno_docente_email_b39bdc68_like" ON "public"."alumno_docente" USING "btree" ("email" "varchar_pattern_ops");
 :   DROP INDEX "public"."alumno_docente_email_b39bdc68_like";
       public         bfiknbgrtbqgnw    false    216            �           1259    2729452 '   alumno_empresa_departamento_id_0fac954e    INDEX     w   CREATE INDEX "alumno_empresa_departamento_id_0fac954e" ON "public"."alumno_empresa" USING "btree" ("departamento_id");
 ?   DROP INDEX "public"."alumno_empresa_departamento_id_0fac954e";
       public         bfiknbgrtbqgnw    false    218            �           1259    2729453 ,   alumno_empresa_departamento_id_0fac954e_like    INDEX     �   CREATE INDEX "alumno_empresa_departamento_id_0fac954e_like" ON "public"."alumno_empresa" USING "btree" ("departamento_id" "varchar_pattern_ops");
 D   DROP INDEX "public"."alumno_empresa_departamento_id_0fac954e_like";
       public         bfiknbgrtbqgnw    false    218            �           1259    2729466 $   alumno_entrevista_alumno_id_e9c64cc7    INDEX     q   CREATE INDEX "alumno_entrevista_alumno_id_e9c64cc7" ON "public"."alumno_entrevista" USING "btree" ("alumno_id");
 <   DROP INDEX "public"."alumno_entrevista_alumno_id_e9c64cc7";
       public         bfiknbgrtbqgnw    false    220            �           1259    2729467 %   alumno_entrevista_empresa_id_e0ffe55f    INDEX     s   CREATE INDEX "alumno_entrevista_empresa_id_e0ffe55f" ON "public"."alumno_entrevista" USING "btree" ("empresa_id");
 =   DROP INDEX "public"."alumno_entrevista_empresa_id_e0ffe55f";
       public         bfiknbgrtbqgnw    false    220            �           1259    2729550 &   alumno_pasantia_entrevista_id_3a65b663    INDEX     u   CREATE INDEX "alumno_pasantia_entrevista_id_3a65b663" ON "public"."alumno_pasantia" USING "btree" ("entrevista_id");
 >   DROP INDEX "public"."alumno_pasantia_entrevista_id_3a65b663";
       public         bfiknbgrtbqgnw    false    233            �           1259    2729551 )   alumno_pasantia_tutor_docente_id_4198a0c7    INDEX     {   CREATE INDEX "alumno_pasantia_tutor_docente_id_4198a0c7" ON "public"."alumno_pasantia" USING "btree" ("tutor_docente_id");
 A   DROP INDEX "public"."alumno_pasantia_tutor_docente_id_4198a0c7";
       public         bfiknbgrtbqgnw    false    233            �           1259    2729552 .   alumno_pasantia_tutor_docente_id_4198a0c7_like    INDEX     �   CREATE INDEX "alumno_pasantia_tutor_docente_id_4198a0c7_like" ON "public"."alumno_pasantia" USING "btree" ("tutor_docente_id" "varchar_pattern_ops");
 F   DROP INDEX "public"."alumno_pasantia_tutor_docente_id_4198a0c7_like";
       public         bfiknbgrtbqgnw    false    233            �           1259    2729553 )   alumno_pasantia_tutor_empresa_id_272f645e    INDEX     {   CREATE INDEX "alumno_pasantia_tutor_empresa_id_272f645e" ON "public"."alumno_pasantia" USING "btree" ("tutor_empresa_id");
 A   DROP INDEX "public"."alumno_pasantia_tutor_empresa_id_272f645e";
       public         bfiknbgrtbqgnw    false    233            �           1259    2729554 .   alumno_pasantia_tutor_empresa_id_272f645e_like    INDEX     �   CREATE INDEX "alumno_pasantia_tutor_empresa_id_272f645e_like" ON "public"."alumno_pasantia" USING "btree" ("tutor_empresa_id" "varchar_pattern_ops");
 F   DROP INDEX "public"."alumno_pasantia_tutor_empresa_id_272f645e_like";
       public         bfiknbgrtbqgnw    false    233            �           1259    2729591 %   alumno_postulacion_alumno_id_aea9d63f    INDEX     s   CREATE INDEX "alumno_postulacion_alumno_id_aea9d63f" ON "public"."alumno_postulacion" USING "btree" ("alumno_id");
 =   DROP INDEX "public"."alumno_postulacion_alumno_id_aea9d63f";
       public         bfiknbgrtbqgnw    false    235            �           1259    2729592 %   alumno_postulacion_puesto_id_b4725e47    INDEX     s   CREATE INDEX "alumno_postulacion_puesto_id_b4725e47" ON "public"."alumno_postulacion" USING "btree" ("puesto_id");
 =   DROP INDEX "public"."alumno_postulacion_puesto_id_b4725e47";
       public         bfiknbgrtbqgnw    false    235            �           1259    2729534 !   alumno_puesto_empresa_id_29e2ace8    INDEX     k   CREATE INDEX "alumno_puesto_empresa_id_29e2ace8" ON "public"."alumno_puesto" USING "btree" ("empresa_id");
 9   DROP INDEX "public"."alumno_puesto_empresa_id_29e2ace8";
       public         bfiknbgrtbqgnw    false    231            �           1259    2729524 9   alumno_subcomisioncarrera__subcomisioncarrera_id_ac986598    INDEX     �   CREATE INDEX "alumno_subcomisioncarrera__subcomisioncarrera_id_ac986598" ON "public"."alumno_subcomisioncarrera_docentes" USING "btree" ("subcomisioncarrera_id");
 Q   DROP INDEX "public"."alumno_subcomisioncarrera__subcomisioncarrera_id_ac986598";
       public         bfiknbgrtbqgnw    false    229            �           1259    2729511 2   alumno_subcomisioncarrera_carrera_id_cace2f94_like    INDEX     �   CREATE INDEX "alumno_subcomisioncarrera_carrera_id_cace2f94_like" ON "public"."alumno_subcomisioncarrera" USING "btree" ("carrera_id" "varchar_pattern_ops");
 J   DROP INDEX "public"."alumno_subcomisioncarrera_carrera_id_cace2f94_like";
       public         bfiknbgrtbqgnw    false    227            �           1259    2729525 6   alumno_subcomisioncarrera_docentes_docente_id_8cba08d1    INDEX     �   CREATE INDEX "alumno_subcomisioncarrera_docentes_docente_id_8cba08d1" ON "public"."alumno_subcomisioncarrera_docentes" USING "btree" ("docente_id");
 N   DROP INDEX "public"."alumno_subcomisioncarrera_docentes_docente_id_8cba08d1";
       public         bfiknbgrtbqgnw    false    229            �           1259    2729526 ;   alumno_subcomisioncarrera_docentes_docente_id_8cba08d1_like    INDEX     �   CREATE INDEX "alumno_subcomisioncarrera_docentes_docente_id_8cba08d1_like" ON "public"."alumno_subcomisioncarrera_docentes" USING "btree" ("docente_id" "varchar_pattern_ops");
 S   DROP INDEX "public"."alumno_subcomisioncarrera_docentes_docente_id_8cba08d1_like";
       public         bfiknbgrtbqgnw    false    229            �           1259    2729500 1   alumno_subcomisionpasant_docente_id_59069914_like    INDEX     �   CREATE INDEX "alumno_subcomisionpasant_docente_id_59069914_like" ON "public"."alumno_subcomisionpasantiaspps_docentes" USING "btree" ("docente_id" "varchar_pattern_ops");
 I   DROP INDEX "public"."alumno_subcomisionpasant_docente_id_59069914_like";
       public         bfiknbgrtbqgnw    false    225            �           1259    2729498 >   alumno_subcomisionpasantia_subcomisionpasantiaspps_id_ef8f9a58    INDEX     �   CREATE INDEX "alumno_subcomisionpasantia_subcomisionpasantiaspps_id_ef8f9a58" ON "public"."alumno_subcomisionpasantiaspps_docentes" USING "btree" ("subcomisionpasantiaspps_id");
 V   DROP INDEX "public"."alumno_subcomisionpasantia_subcomisionpasantiaspps_id_ef8f9a58";
       public         bfiknbgrtbqgnw    false    225            �           1259    2729485 <   alumno_subcomisionpasantiaspps_departamento_id_8e15a99c_like    INDEX     �   CREATE INDEX "alumno_subcomisionpasantiaspps_departamento_id_8e15a99c_like" ON "public"."alumno_subcomisionpasantiaspps" USING "btree" ("departamento_id" "varchar_pattern_ops");
 T   DROP INDEX "public"."alumno_subcomisionpasantiaspps_departamento_id_8e15a99c_like";
       public         bfiknbgrtbqgnw    false    223            �           1259    2729499 ;   alumno_subcomisionpasantiaspps_docentes_docente_id_59069914    INDEX     �   CREATE INDEX "alumno_subcomisionpasantiaspps_docentes_docente_id_59069914" ON "public"."alumno_subcomisionpasantiaspps_docentes" USING "btree" ("docente_id");
 S   DROP INDEX "public"."alumno_subcomisionpasantiaspps_docentes_docente_id_59069914";
       public         bfiknbgrtbqgnw    false    225            �           1259    2729474 '   alumno_tutorempresa_empresa_id_eb9e5289    INDEX     w   CREATE INDEX "alumno_tutorempresa_empresa_id_eb9e5289" ON "public"."alumno_tutorempresa" USING "btree" ("empresa_id");
 ?   DROP INDEX "public"."alumno_tutorempresa_empresa_id_eb9e5289";
       public         bfiknbgrtbqgnw    false    221            �           1259    2729473 &   alumno_tutorempresa_mail_c1e2e032_like    INDEX     �   CREATE INDEX "alumno_tutorempresa_mail_c1e2e032_like" ON "public"."alumno_tutorempresa" USING "btree" ("mail" "varchar_pattern_ops");
 >   DROP INDEX "public"."alumno_tutorempresa_mail_c1e2e032_like";
       public         bfiknbgrtbqgnw    false    221            b           1259    2729415 $   alumno_user_groups_group_id_b22eb17f    INDEX     q   CREATE INDEX "alumno_user_groups_group_id_b22eb17f" ON "public"."alumno_user_groups" USING "btree" ("group_id");
 <   DROP INDEX "public"."alumno_user_groups_group_id_b22eb17f";
       public         bfiknbgrtbqgnw    false    209            e           1259    2729414 #   alumno_user_groups_user_id_2d910415    INDEX     o   CREATE INDEX "alumno_user_groups_user_id_2d910415" ON "public"."alumno_user_groups" USING "btree" ("user_id");
 ;   DROP INDEX "public"."alumno_user_groups_user_id_2d910415";
       public         bfiknbgrtbqgnw    false    209            j           1259    2729429 3   alumno_user_user_permissions_permission_id_d6517408    INDEX     �   CREATE INDEX "alumno_user_user_permissions_permission_id_d6517408" ON "public"."alumno_user_user_permissions" USING "btree" ("permission_id");
 K   DROP INDEX "public"."alumno_user_user_permissions_permission_id_d6517408";
       public         bfiknbgrtbqgnw    false    211            m           1259    2729428 -   alumno_user_user_permissions_user_id_7d3342b2    INDEX     �   CREATE INDEX "alumno_user_user_permissions_user_id_7d3342b2" ON "public"."alumno_user_user_permissions" USING "btree" ("user_id");
 E   DROP INDEX "public"."alumno_user_user_permissions_user_id_7d3342b2";
       public         bfiknbgrtbqgnw    false    211            _           1259    2729401 "   alumno_user_username_0a14f543_like    INDEX     ~   CREATE INDEX "alumno_user_username_0a14f543_like" ON "public"."alumno_user" USING "btree" ("username" "varchar_pattern_ops");
 :   DROP INDEX "public"."alumno_user_username_0a14f543_like";
       public         bfiknbgrtbqgnw    false    207            R           1259    2729222    auth_group_name_a6ea08ec_like    INDEX     t   CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING "btree" ("name" "varchar_pattern_ops");
 5   DROP INDEX "public"."auth_group_name_a6ea08ec_like";
       public         bfiknbgrtbqgnw    false    203            W           1259    2729218 (   auth_group_permissions_group_id_b120cbf9    INDEX     y   CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING "btree" ("group_id");
 @   DROP INDEX "public"."auth_group_permissions_group_id_b120cbf9";
       public         bfiknbgrtbqgnw    false    205            Z           1259    2729219 -   auth_group_permissions_permission_id_84c5c92e    INDEX     �   CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING "btree" ("permission_id");
 E   DROP INDEX "public"."auth_group_permissions_permission_id_84c5c92e";
       public         bfiknbgrtbqgnw    false    205            M           1259    2729204 (   auth_permission_content_type_id_2f476e4b    INDEX     y   CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING "btree" ("content_type_id");
 @   DROP INDEX "public"."auth_permission_content_type_id_2f476e4b";
       public         bfiknbgrtbqgnw    false    201            �           1259    2729629 )   django_admin_log_content_type_id_c4bce8eb    INDEX     {   CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING "btree" ("content_type_id");
 A   DROP INDEX "public"."django_admin_log_content_type_id_c4bce8eb";
       public         bfiknbgrtbqgnw    false    239            �           1259    2729630 !   django_admin_log_user_id_c564eba6    INDEX     k   CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING "btree" ("user_id");
 9   DROP INDEX "public"."django_admin_log_user_id_c564eba6";
       public         bfiknbgrtbqgnw    false    239            �           1259    2729677 3   django_celery_beat_periodictask_crontab_id_d3cba168    INDEX     �   CREATE INDEX "django_celery_beat_periodictask_crontab_id_d3cba168" ON "public"."django_celery_beat_periodictask" USING "btree" ("crontab_id");
 K   DROP INDEX "public"."django_celery_beat_periodictask_crontab_id_d3cba168";
       public         bfiknbgrtbqgnw    false    245            �           1259    2729678 4   django_celery_beat_periodictask_interval_id_a8ca27da    INDEX     �   CREATE INDEX "django_celery_beat_periodictask_interval_id_a8ca27da" ON "public"."django_celery_beat_periodictask" USING "btree" ("interval_id");
 L   DROP INDEX "public"."django_celery_beat_periodictask_interval_id_a8ca27da";
       public         bfiknbgrtbqgnw    false    245            �           1259    2729676 2   django_celery_beat_periodictask_name_265a36b7_like    INDEX     �   CREATE INDEX "django_celery_beat_periodictask_name_265a36b7_like" ON "public"."django_celery_beat_periodictask" USING "btree" ("name" "varchar_pattern_ops");
 J   DROP INDEX "public"."django_celery_beat_periodictask_name_265a36b7_like";
       public         bfiknbgrtbqgnw    false    245            �           1259    2729687 1   django_celery_beat_periodictask_solar_id_a87ce72c    INDEX     �   CREATE INDEX "django_celery_beat_periodictask_solar_id_a87ce72c" ON "public"."django_celery_beat_periodictask" USING "btree" ("solar_id");
 I   DROP INDEX "public"."django_celery_beat_periodictask_solar_id_a87ce72c";
       public         bfiknbgrtbqgnw    false    245            �           1259    2729715 0   django_celery_results_taskresult_hidden_cd77412f    INDEX     �   CREATE INDEX "django_celery_results_taskresult_hidden_cd77412f" ON "public"."django_celery_results_taskresult" USING "btree" ("hidden");
 H   DROP INDEX "public"."django_celery_results_taskresult_hidden_cd77412f";
       public         bfiknbgrtbqgnw    false    250            �           1259    2729714 6   django_celery_results_taskresult_task_id_de0d95bf_like    INDEX     �   CREATE INDEX "django_celery_results_taskresult_task_id_de0d95bf_like" ON "public"."django_celery_results_taskresult" USING "btree" ("task_id" "varchar_pattern_ops");
 N   DROP INDEX "public"."django_celery_results_taskresult_task_id_de0d95bf_like";
       public         bfiknbgrtbqgnw    false    250            �           1259    2729725 #   django_session_expire_date_a5c62663    INDEX     o   CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING "btree" ("expire_date");
 ;   DROP INDEX "public"."django_session_expire_date_a5c62663";
       public         bfiknbgrtbqgnw    false    251            �           1259    2729724 (   django_session_session_key_c0390e0f_like    INDEX     �   CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING "btree" ("session_key" "varchar_pattern_ops");
 @   DROP INDEX "public"."django_session_session_key_c0390e0f_like";
       public         bfiknbgrtbqgnw    false    251            �           2606    2729564 H   alumno_alumno alumno_alumno_carrera_id_41131f15_fk_alumno_carrera_nombre    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_alumno"
    ADD CONSTRAINT "alumno_alumno_carrera_id_41131f15_fk_alumno_carrera_nombre" FOREIGN KEY ("carrera_id") REFERENCES "public"."alumno_carrera"("nombre") DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY "public"."alumno_alumno" DROP CONSTRAINT "alumno_alumno_carrera_id_41131f15_fk_alumno_carrera_nombre";
       public       bfiknbgrtbqgnw    false    3964    213    214            �           2606    2729569 >   alumno_alumno alumno_alumno_user_id_2ae817e9_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_alumno"
    ADD CONSTRAINT "alumno_alumno_user_id_2ae817e9_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY "public"."alumno_alumno" DROP CONSTRAINT "alumno_alumno_user_id_2ae817e9_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    207    213    3934            �           2606    2729557 C   alumno_carrera alumno_carrera_departamento_id_0050a97f_fk_alumno_de    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_carrera"
    ADD CONSTRAINT "alumno_carrera_departamento_id_0050a97f_fk_alumno_de" FOREIGN KEY ("departamento_id") REFERENCES "public"."alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY "public"."alumno_carrera" DROP CONSTRAINT "alumno_carrera_departamento_id_0050a97f_fk_alumno_de";
       public       bfiknbgrtbqgnw    false    214    215    3967                       2606    2729593 V   alumno_directordepartamento alumno_directordepar_departamento_id_65af14d5_fk_alumno_de    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepar_departamento_id_65af14d5_fk_alumno_de" FOREIGN KEY ("departamento_id") REFERENCES "public"."alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepar_departamento_id_65af14d5_fk_alumno_de";
       public       bfiknbgrtbqgnw    false    3967    215    237                       2606    2729598 Q   alumno_directordepartamento alumno_directordepar_docente_id_53302dee_fk_alumno_do    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_directordepartamento"
    ADD CONSTRAINT "alumno_directordepar_docente_id_53302dee_fk_alumno_do" FOREIGN KEY ("docente_id") REFERENCES "public"."alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_directordepartamento" DROP CONSTRAINT "alumno_directordepar_docente_id_53302dee_fk_alumno_do";
       public       bfiknbgrtbqgnw    false    3972    216    237            �           2606    2729432 C   alumno_docente alumno_docente_departamento_id_44da43af_fk_alumno_de    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_docente"
    ADD CONSTRAINT "alumno_docente_departamento_id_44da43af_fk_alumno_de" FOREIGN KEY ("departamento_id") REFERENCES "public"."alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY "public"."alumno_docente" DROP CONSTRAINT "alumno_docente_departamento_id_44da43af_fk_alumno_de";
       public       bfiknbgrtbqgnw    false    216    215    3967            �           2606    2729440 C   alumno_empresa alumno_empresa_departamento_id_0fac954e_fk_alumno_de    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_empresa"
    ADD CONSTRAINT "alumno_empresa_departamento_id_0fac954e_fk_alumno_de" FOREIGN KEY ("departamento_id") REFERENCES "public"."alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY "public"."alumno_empresa" DROP CONSTRAINT "alumno_empresa_departamento_id_0fac954e_fk_alumno_de";
       public       bfiknbgrtbqgnw    false    218    3967    215            �           2606    2729445 @   alumno_empresa alumno_empresa_user_id_2440e787_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_empresa"
    ADD CONSTRAINT "alumno_empresa_user_id_2440e787_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY "public"."alumno_empresa" DROP CONSTRAINT "alumno_empresa_user_id_2440e787_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    218    3934    207                        2606    2729454 J   alumno_entrevista alumno_entrevista_alumno_id_e9c64cc7_fk_alumno_alumno_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_entrevista"
    ADD CONSTRAINT "alumno_entrevista_alumno_id_e9c64cc7_fk_alumno_alumno_id" FOREIGN KEY ("alumno_id") REFERENCES "public"."alumno_alumno"("id") DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY "public"."alumno_entrevista" DROP CONSTRAINT "alumno_entrevista_alumno_id_e9c64cc7_fk_alumno_alumno_id";
       public       bfiknbgrtbqgnw    false    3955    213    220                       2606    2729459 L   alumno_entrevista alumno_entrevista_empresa_id_e0ffe55f_fk_alumno_empresa_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_entrevista"
    ADD CONSTRAINT "alumno_entrevista_empresa_id_e0ffe55f_fk_alumno_empresa_id" FOREIGN KEY ("empresa_id") REFERENCES "public"."alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY "public"."alumno_entrevista" DROP CONSTRAINT "alumno_entrevista_empresa_id_e0ffe55f_fk_alumno_empresa_id";
       public       bfiknbgrtbqgnw    false    220    3978    218                       2606    2729535 N   alumno_pasantia alumno_pasantia_entrevista_id_3a65b663_fk_alumno_entrevista_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_pasantia"
    ADD CONSTRAINT "alumno_pasantia_entrevista_id_3a65b663_fk_alumno_entrevista_id" FOREIGN KEY ("entrevista_id") REFERENCES "public"."alumno_entrevista"("id") DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY "public"."alumno_pasantia" DROP CONSTRAINT "alumno_pasantia_entrevista_id_3a65b663_fk_alumno_entrevista_id";
       public       bfiknbgrtbqgnw    false    220    233    3986                       2606    2729540 F   alumno_pasantia alumno_pasantia_tutor_docente_id_4198a0c7_fk_alumno_do    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_pasantia"
    ADD CONSTRAINT "alumno_pasantia_tutor_docente_id_4198a0c7_fk_alumno_do" FOREIGN KEY ("tutor_docente_id") REFERENCES "public"."alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY "public"."alumno_pasantia" DROP CONSTRAINT "alumno_pasantia_tutor_docente_id_4198a0c7_fk_alumno_do";
       public       bfiknbgrtbqgnw    false    3972    216    233                       2606    2729545 F   alumno_pasantia alumno_pasantia_tutor_empresa_id_272f645e_fk_alumno_tu    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_pasantia"
    ADD CONSTRAINT "alumno_pasantia_tutor_empresa_id_272f645e_fk_alumno_tu" FOREIGN KEY ("tutor_empresa_id") REFERENCES "public"."alumno_tutorempresa"("mail") DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY "public"."alumno_pasantia" DROP CONSTRAINT "alumno_pasantia_tutor_empresa_id_272f645e_fk_alumno_tu";
       public       bfiknbgrtbqgnw    false    3990    233    221                       2606    2729574 L   alumno_postulacion alumno_postulacion_alumno_id_aea9d63f_fk_alumno_alumno_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_alumno_id_aea9d63f_fk_alumno_alumno_id" FOREIGN KEY ("alumno_id") REFERENCES "public"."alumno_alumno"("id") DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_alumno_id_aea9d63f_fk_alumno_alumno_id";
       public       bfiknbgrtbqgnw    false    213    3955    235                       2606    2729579 I   alumno_postulacion alumno_postulacion_entrevista_id_f701f6f7_fk_alumno_en    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_entrevista_id_f701f6f7_fk_alumno_en" FOREIGN KEY ("entrevista_id") REFERENCES "public"."alumno_entrevista"("id") DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_entrevista_id_f701f6f7_fk_alumno_en";
       public       bfiknbgrtbqgnw    false    3986    235    220                       2606    2729584 E   alumno_postulacion alumno_postulacion_puesto_id_b4725e47_fk_alumno_pu    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_postulacion"
    ADD CONSTRAINT "alumno_postulacion_puesto_id_b4725e47_fk_alumno_pu" FOREIGN KEY ("puesto_id") REFERENCES "public"."alumno_puesto"("puesto_id") DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY "public"."alumno_postulacion" DROP CONSTRAINT "alumno_postulacion_puesto_id_b4725e47_fk_alumno_pu";
       public       bfiknbgrtbqgnw    false    235    4023    231                       2606    2729527 D   alumno_puesto alumno_puesto_empresa_id_29e2ace8_fk_alumno_empresa_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_puesto"
    ADD CONSTRAINT "alumno_puesto_empresa_id_29e2ace8_fk_alumno_empresa_id" FOREIGN KEY ("empresa_id") REFERENCES "public"."alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY "public"."alumno_puesto" DROP CONSTRAINT "alumno_puesto_empresa_id_29e2ace8_fk_alumno_empresa_id";
       public       bfiknbgrtbqgnw    false    231    218    3978                       2606    2729501 O   alumno_subcomisioncarrera alumno_subcomisionca_carrera_id_cace2f94_fk_alumno_ca    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera"
    ADD CONSTRAINT "alumno_subcomisionca_carrera_id_cace2f94_fk_alumno_ca" FOREIGN KEY ("carrera_id") REFERENCES "public"."alumno_carrera"("nombre") DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" DROP CONSTRAINT "alumno_subcomisionca_carrera_id_cace2f94_fk_alumno_ca";
       public       bfiknbgrtbqgnw    false    3964    214    227            
           2606    2729517 X   alumno_subcomisioncarrera_docentes alumno_subcomisionca_docente_id_8cba08d1_fk_alumno_do    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes"
    ADD CONSTRAINT "alumno_subcomisionca_docente_id_8cba08d1_fk_alumno_do" FOREIGN KEY ("docente_id") REFERENCES "public"."alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes" DROP CONSTRAINT "alumno_subcomisionca_docente_id_8cba08d1_fk_alumno_do";
       public       bfiknbgrtbqgnw    false    229    216    3972            	           2606    2729512 b   alumno_subcomisioncarrera_docentes alumno_subcomisionca_subcomisioncarrera_i_ac986598_fk_alumno_su    FK CONSTRAINT       ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes"
    ADD CONSTRAINT "alumno_subcomisionca_subcomisioncarrera_i_ac986598_fk_alumno_su" FOREIGN KEY ("subcomisioncarrera_id") REFERENCES "public"."alumno_subcomisioncarrera"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera_docentes" DROP CONSTRAINT "alumno_subcomisionca_subcomisioncarrera_i_ac986598_fk_alumno_su";
       public       bfiknbgrtbqgnw    false    227    4009    229                       2606    2729506 V   alumno_subcomisioncarrera alumno_subcomisioncarrera_user_id_b7ed6d10_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera"
    ADD CONSTRAINT "alumno_subcomisioncarrera_user_id_b7ed6d10_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisioncarrera" DROP CONSTRAINT "alumno_subcomisioncarrera_user_id_b7ed6d10_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    207    227    3934                       2606    2729475 Y   alumno_subcomisionpasantiaspps alumno_subcomisionpa_departamento_id_8e15a99c_fk_alumno_de    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps"
    ADD CONSTRAINT "alumno_subcomisionpa_departamento_id_8e15a99c_fk_alumno_de" FOREIGN KEY ("departamento_id") REFERENCES "public"."alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" DROP CONSTRAINT "alumno_subcomisionpa_departamento_id_8e15a99c_fk_alumno_de";
       public       bfiknbgrtbqgnw    false    3967    215    223                       2606    2729491 ]   alumno_subcomisionpasantiaspps_docentes alumno_subcomisionpa_docente_id_59069914_fk_alumno_do    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes"
    ADD CONSTRAINT "alumno_subcomisionpa_docente_id_59069914_fk_alumno_do" FOREIGN KEY ("docente_id") REFERENCES "public"."alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes" DROP CONSTRAINT "alumno_subcomisionpa_docente_id_59069914_fk_alumno_do";
       public       bfiknbgrtbqgnw    false    216    3972    225                       2606    2729486 g   alumno_subcomisionpasantiaspps_docentes alumno_subcomisionpa_subcomisionpasantias_ef8f9a58_fk_alumno_su    FK CONSTRAINT       ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes"
    ADD CONSTRAINT "alumno_subcomisionpa_subcomisionpasantias_ef8f9a58_fk_alumno_su" FOREIGN KEY ("subcomisionpasantiaspps_id") REFERENCES "public"."alumno_subcomisionpasantiaspps"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps_docentes" DROP CONSTRAINT "alumno_subcomisionpa_subcomisionpasantias_ef8f9a58_fk_alumno_su";
       public       bfiknbgrtbqgnw    false    225    223    3995                       2606    2729480 Q   alumno_subcomisionpasantiaspps alumno_subcomisionpa_user_id_2db293b1_fk_alumno_us    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps"
    ADD CONSTRAINT "alumno_subcomisionpa_user_id_2db293b1_fk_alumno_us" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_subcomisionpasantiaspps" DROP CONSTRAINT "alumno_subcomisionpa_user_id_2db293b1_fk_alumno_us";
       public       bfiknbgrtbqgnw    false    207    223    3934                       2606    2729468 P   alumno_tutorempresa alumno_tutorempresa_empresa_id_eb9e5289_fk_alumno_empresa_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_tutorempresa"
    ADD CONSTRAINT "alumno_tutorempresa_empresa_id_eb9e5289_fk_alumno_empresa_id" FOREIGN KEY ("empresa_id") REFERENCES "public"."alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_tutorempresa" DROP CONSTRAINT "alumno_tutorempresa_empresa_id_eb9e5289_fk_alumno_empresa_id";
       public       bfiknbgrtbqgnw    false    221    3978    218            �           2606    2729407 H   alumno_user_groups alumno_user_groups_group_id_b22eb17f_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_groups"
    ADD CONSTRAINT "alumno_user_groups_group_id_b22eb17f_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY "public"."alumno_user_groups" DROP CONSTRAINT "alumno_user_groups_group_id_b22eb17f_fk_auth_group_id";
       public       bfiknbgrtbqgnw    false    203    209    3926            �           2606    2729402 H   alumno_user_groups alumno_user_groups_user_id_2d910415_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_groups"
    ADD CONSTRAINT "alumno_user_groups_user_id_2d910415_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY "public"."alumno_user_groups" DROP CONSTRAINT "alumno_user_groups_user_id_2d910415_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    3934    207    209            �           2606    2729421 U   alumno_user_user_permissions alumno_user_user_per_permission_id_d6517408_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_user_permissions"
    ADD CONSTRAINT "alumno_user_user_per_permission_id_d6517408_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_user_user_permissions" DROP CONSTRAINT "alumno_user_user_per_permission_id_d6517408_fk_auth_perm";
       public       bfiknbgrtbqgnw    false    201    211    3921            �           2606    2729416 \   alumno_user_user_permissions alumno_user_user_permissions_user_id_7d3342b2_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."alumno_user_user_permissions"
    ADD CONSTRAINT "alumno_user_user_permissions_user_id_7d3342b2_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."alumno_user_user_permissions" DROP CONSTRAINT "alumno_user_user_permissions_user_id_7d3342b2_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    207    3934    211            �           2606    2729211 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm";
       public       bfiknbgrtbqgnw    false    3921    201    205            �           2606    2729206 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."auth_group_permissions" DROP CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id";
       public       bfiknbgrtbqgnw    false    205    3926    203            �           2606    2729197 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY "public"."auth_permission" DROP CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co";
       public       bfiknbgrtbqgnw    false    201    3916    199                       2606    2729619 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co";
       public       bfiknbgrtbqgnw    false    3916    239    199                       2606    2729624 D   django_admin_log django_admin_log_user_id_c564eba6_fk_alumno_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_alumno_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."alumno_user"("id") DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY "public"."django_admin_log" DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_alumno_user_id";
       public       bfiknbgrtbqgnw    false    207    3934    239                       2606    2729666 U   django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce    FK CONSTRAINT        ALTER TABLE ONLY "public"."django_celery_beat_periodictask"
    ADD CONSTRAINT "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce" FOREIGN KEY ("crontab_id") REFERENCES "public"."django_celery_beat_crontabschedule"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" DROP CONSTRAINT "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce";
       public       bfiknbgrtbqgnw    false    245    4056    241                       2606    2729671 V   django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce    FK CONSTRAINT       ALTER TABLE ONLY "public"."django_celery_beat_periodictask"
    ADD CONSTRAINT "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce" FOREIGN KEY ("interval_id") REFERENCES "public"."django_celery_beat_intervalschedule"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" DROP CONSTRAINT "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce";
       public       bfiknbgrtbqgnw    false    245    243    4058                       2606    2729688 S   django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask"
    ADD CONSTRAINT "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce" FOREIGN KEY ("solar_id") REFERENCES "public"."django_celery_beat_solarschedule"("id") DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "public"."django_celery_beat_periodictask" DROP CONSTRAINT "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce";
       public       bfiknbgrtbqgnw    false    248    245    4072            �   �  x��Z�n�6]K_�} wQ�^fz���`2�	и%�d�%R!%���eY�	�cs���.��)U0��K��乯s/͢�,[d,��Nk�wUW�w_?�%�V��NH����d>�(ŗO?��o�=�j�}�T$��T�Oܴ]!�;�M���Z�	�T�Z�w�_�GQ6c�t�Ig���Oٯg�GYr)�>�A	��G�W�>޷X"���z9ck��wZ�*��Z�(����C����;���g�!�T�����4{�F��^Tܼ;}�n�zu��������NS��\��h���$Oޫ��Z*�&��9`��|	*UEƮ��JJwBU<W��x`}�<�~�-�������eG7<�n�*�[�Qɾ����=@�V���rq��Lv�{�;`����7��.��k�������'�-;�$n=#]�u�?xh����P�|P����"6���@ \��apia��;�s���WXD�g����f�
�,�K���;�kgs�?�B��r~��ΐ��(i�a�E,�����?G�4��'�;:�8%��}�������TI��B��E:�<��Z���`ک�tb�Dw;���yD��1�������*j{G�I�=7Hϧc�����E��1������ j�B��BA`N�?3~������Y4���	(��7vᄐ�wX��0��`��+��Ra8
kZ� ��Ʊ�](�p�N N=����Ϊ� x�x�����-[��wTVB��!��C�f����O)�ͺ�1���z�O�7�$��s���ȇƝ[v<n=@�m4���\�#x�>�5��.l��
�6�ڷ����rW�,gɵ�A,�չ+�N�n��@y��?;��{�;�fv�.��?.�)�ǥ��P�l�R��V1�-c[��ɽ&��_�Q��Cc�%9%������I���my���Ou��n(���Eo��U��StYr�	.��ѩ�R�Di���j�2|*ԕ����71�-�j�0�#cT�=pY����G���B�[�����k%[ RD0J��G�픾�2� mcf���b˼8R+PSM�@wW�0���s(p�;+�ߞ�`�d(�j�������!���P�g����Fr�)�9��|�T5��P���@�݊.,+��E�*�����#������^	�N?��C����S��\s4w�H$����ψ9�:��c�>s�g^���z�����*�k#�`��j�:�ZPqj2�.-='���Z���%������Ҹn��L;��̲����r�
��_�!��`v{.3!��ɿ�~���O����!��0�;��/���":؄���oͱ�1��4l�Oؖ���&˪kP��P�x�+>��9Ue#ҏ��x)��qf[��m���kq;��
ۆ�z����C�`q6�?0�lg����g��yjT�EF�@8}����i���I�Kg��oh|r�QWq��_m�W��$���Qԁ�]��ܲ�t�yk<KgW,��&��T��Ly���@մ��iZ��1����6�l�ͶޱOw�p7��vCU�O���>.5�=���8��:ٳ?�kU��y(�*����"3�#Mf$�8[��ǅ�����U�t�^TJ
;���>�	ާj����M�ɼ�`���FIC��;y����m��F3�|�!����Z�C�n�;(�����*��~6�W7/��>�\����N8���{h���Wi��,���E� zD�n{?��g5�Q��ן�,�V}���@���V�Ρ=4��]*p�␜0fqh���unlj��8�/�ݷ�n�c�1$x9�B�!>�Vڡj�@uHY�m�<���KIN�B��r�a�J��m�W|<H^U:���Wn�y����v�ي��k�+��+�)L��n5���/Wq����      �   �   x���1�0Egr���K�R�!�I~�%�TN�}8 G��hK�J��eY�}�Fn��Y�m���3���i� ��zL��'�̽�=	?��3)W�iD61t}&����y�����:.o�w� ���#�u�����^c�4��q��6�| �ߜJ      �   *   x�sI-H,*I�M�+�WHIU��K�/�=��$39�+F��� �      �      x������ � �      �   �  x���Mn�0���)x� ���]�VȒK�Zt3�ؖ�,��U��� =D�]t�]��X�VD(�0+6��͛y����54Qle[�i�g�T�T�N���NJ�%��=�l�wC+EE������N�0�V��j�$LF�l`��>͸U��oK��R�%�I�BJ>��t�4(��h��-�dY��h�4hv��6�Q��Μ3��>3|�
Qt��jؒ9���{�������O��4�PjU��y��� ���9�i�M����)X��88��[��+�k;���%��PW�<?��P�6ڐE�#ݲ̩	N���Wv�lo�y��;A�+��Z\9�T��/^��Oh�+H����Y\I�/Z���|914���pL���F��->��RV�@V�!��E#8��Z}������4GM	z]���OOho8���x�A��oˉ!�*�o0��U�p�	l�1U�a��O_P��CX��0��vyS��X�<I]M�V�-|��҃.h�~T���W�t�1ϱŪ�;I*��GЙo������nw���DQ�K�s��K����-9d*bi잊������Hn���\�B�P������˦�_0э8Fӽ}���J:]�ا����+���/��TK����X��9�BL�+HN:����>�,[G�8�Ի�=�2�^3)E��������qw2�L��/*      �   5  x���_n1Ɵק�x��7�Uh�R+U@�*E�� ��������(=C���j�%�M�63��~3�4��*�Br�Q��k1�\��M`�7�ҟz�g��Iy�M�����8ޣ~Z�".wR��'m��Kiɓ�j׶Z%��kͱe�Dad\`���T��a9D#ҷ�+V���W8�xQV
5���D����1|�j������}�;���X�}�ʷ��`��*眀j�ol}�>��#8�x�x���1FEbWm���v
��a������E�xl$��P2
C���Ċ3�<Yý)y넬���.��O�F0�@n�8 �F#C�{!�;5�՝�t�S�5^_%8wd�K.��aiRT�5*Oq���2ܕ����w4�`�d�Y�i�9iA~����Rr�m:��f捹Sf�Ԯ���m���}��t�����$7L�Z�/�!��EQ&R�|$M;V�X!�ܚ4�e�P���4������o����	�I�Su%5���FDѣ�+،H:�f�Ve����9�>�e��$���BW�0 lQ��U<`4!?B�?] �c      �      x������ � �      �      x������ � �      �      x������ � �      �   X   x�3�tr�,(�O/J�M,:�P�$?%_!5G!���D�������ĲD��ϙS��Z���P��Zb��*X ���Ŝ%@h����� q��      �   D   x�3�IM��LN,)-JT��,K-*�,I,�LTH�SJMI-VHIUp��-(-IL�/J,�4����� ��#      �   '   x�3�4�L�ON�+I5tH,N�K���2F�c���� P��      �   .   x�3�tI-H,*I�M�+�WHIU��K�/�=��$39�ӄ+F��� ��      �   "   x�3�4�L�ON�+I5tH,N�K������� e�      �      x������ � �      �      x�}Zǒ�L�]�O�;�$������#����H� ᄓ��G�pW���~�I$Q���PuEUr�DuN��g�&q$1N�C�+sA3(Nc�����R��e*�p5�����2�w R��f���k6ѨUy��>6��v��O	q;�@�	A�{Q'3]��a���ў؛y���q?%G�;���A~Q��ui��1��a���A��ϒKa���+4N�M�I=���9�N�0�i�����g�^��|X�<�ɼ��~�N�x�YV���0��ʀhC����Nu1��)�%�A��`��pͳ��w�ajHq8��m��ez9���{c�{�-e��W��?��"F���ľ(���<�=�A� ��s�"?�ȡ8�W����!��?T<?�`�p�K1<I|?��*�i�\�qV��2�l'1/M%:��m_�����ˉؙ�x�D�-�N�g�F'��Nj[���Vbz�G-�n�y&ȋ +۲�
��"V���� ���x
��/��<��!���z/d�ٯ����d�D��&s�����}�.JA�%1��{ �eҷ���;�%���|'�|����A_���*�2��)@hGy\�������͡��>頾H�Ka<�<u(?��:Vj�3�0�����<�%�2�lex�>w2�>i�;�e�pʰñ
N���$vj¥������y��к����$�3�q��/���`LEv��A6���.�Խ��:���zl����G.;&Y����D�g����S��$�߫� �:\e��Nd�f��CkP`\����04��iKS_�eX����(�iw�;3w�	���\���$JW]�k�2�b����}�52/��%'�Ad�q'O�Ȍ�Y<D�����6��$��/��{ֱ�ɑ���J�����+�b
1���0�v=E�m7JY��;� �tT���	0����� Й�
�ӂ�����s��c�!�.ƒ4C����F:���J�,U��|�<%��a���X_�I��Lf%�a�ʦ�]��^�SG0����FO�~�q�lDu!G��p�{�8��"��vkS�:]��bX��xV���yT�N�ǻ`��	ΰA�N�a�G`�0�v\;��c}� �`\����������%��B3]�������{��R���2��5y� �!�l�Euo\�w8؀�� �E��'�i��z��8�.��r�G�1�8��W
�x�����R�S���$C�R��R�"�y����Y���{�X�q;���t�q��sF�O�܄��I����lү>�~���B���v�'��w)���yq�
���! ��Ԗىi�#,�s|߯�q;b͙�[��x,S҂?����r���� |UBB�A%O�ͼF���U�q��x���P��gs�"��r��������Eg��?1����+� 6�#6ҷb�[v@���ѻ}.*_��eϰL����l-�ۆ/ۇ�>�b�u�3ߺ
��w�і.�������lx���6�J� h��V�QH���w�Z��غ0@ڣ�%"<.�~"�U�k��k�I8���]rۏ�|�&�C��i0N�GZ	�O
o�X����S��mQJ%���P^f�(s�`4�)5������\���D�����B�.A�S'1�!�^ͭ~�W��\P�.��<Z��($VM��Z�l�ױ�4G�[󥢄�Uɩc�c �O��ү�?g}"�U�fH�k�y���>>��;�.W����Ė��/�/SE���◽�a��=#iŕ���^���$e�Чaac�E���m�O�?зs?��߰�aI�W@j�#�#�����
�%�Sny�Ɠ�f32�Zּw�7��z��,H7�@w��wX5���fQ9�Q�G;�a�B[�'����۹�D�02u	��9�Vѐ�5r�ʩZ�	�W���B���{v<	Y���"	�u�.��ڣpeH}�9)��Y�Ily&l¾1X���7�>�g�}@�4�}�t��6)�g����g%h�&=�XM�9?����|�O�����A=�R�wX]�!,�c;�:�J�B��a��
D�_໙�Ѝ�.��8Wgg�!=��lk{�^�h���t'�.��6���Pɜ��<8�ƻ]x���Mw��'���i��G�t�_IA�pXA����������ul%����n��/�ڻ%7at����[����`&${γf�k���e5Kur��rF�N
��cCX�z���2~B��@����a3�R���S���S��Pjs��tC��"٤u!�rx�i�6nE��C��Q�NP<����CX�!����02����~�'%�����ﳖ�����Gs���^QF'f����7� >Y��*\��L�3_r���Z5{-�)����؁�%�.^�#��>Ad� ��� �ƾ0�KS,�׻�h��֑��e��`e�2�&׾zHF�9�ސ�V9�K9Av�d�l�C����ړ�j�:�"0	�+d������-�E�]���KE��l�nSCe6��e&�����ۭp�r���61}M�dF��L.�Խ|8߷��ߢh�uRX=G��H`������ZUd-�ih���:� i�1�jҳF	�xΨ���(��*c�K����t܋�����UO����;����=����0�ȡ7 �*Vlڰ�x���� ����tǇ~�j�.�S]w�DC�^�UN?J��Io�k�`h�d|���:�,Ʀ~#��"�O�J�-�������'�5s�i��C���b�(�8��=����P_DulG��w�mH׫Kbj��������]��,��.�k��\#V��d.��vf��9:'����%��>ݍo �б���0X�П����I[�PKpuH4�m�t��� 8���qcp���A#�0�U�t�i������ln��1��NYW~Qu���?��!@f�:�'�(�������,����M]����~��Ao,���x�X�ET�E�X�T�f��xI�ę�k��a鸮<� N�Ȭz�;�c	H#/��'2�-����t�9du���1���xK6d�Q�7�\���=,�m�>A��2��cc=����|�g�����v���8�N=X��G2�}������:�AV/C����_�Z�U;ٰ�r{V㻢�3�k�x�T���Hް���=�I�u\Q9;UM�Ӈaw� 6�)!��똌�tL�W�d<K2$U7ld"��":��V��y�Ur8��� `�D��8���g>ڞr���Ί����c��}&l��+#D�u��J~�
��.ErE�T6�昐��v��]�b�&���\8�q��3*^�:8򔸙,�0�.f��i�/�BV�72��O�*���<Mp�q#ٰ��+om<�D9�+�����lG���N�=,<���S!�~j���}��Wod�(��NtD�;�K�K�������.հͨ��عqW���=vE�/��S�̬��Q V֘�'��W� xǼ������N�9D���}��|"I�e�r�'j���&U�pcK@����	��R��>+��uj%��T�h70	©�L��-;|�,"�ZҊ��9��$��$[eu��]S�.�j�qG�\��r���=��݂%�d	l7,A����|s��6��Ws��q���w�3��W'52�kr�'r��]����
6T�3�/��:�pEO�y>���R4�Ro�d/ܝ&�hln���}�ܶ�ـ]��Z-��1�m��)��#p˳5ņ�u�;Ia�w��Ԭ}�zӶo�R)�`7������'c�(Zr�NkO��6/�4�/�F~�Ouc��~��}"�We����ͯ�6�滐R^,/�m#��_��(��|�Kk�͖Z���rgy�>g��_��vM��	$�9�����W���.�3�Ͳ��Ҋ�_N7�H��b3�����5��ߗ
���1�;Xm���~_����/��>|�~{����C��&\����ؐwn�5!���WW����'o�$�΍�xf���)�b������k�ԉ1OA�%E��(��������[Y��r��u�lE�
�dF[WDsI�D� X   ���~�0�Uf�Un�`�]�Dw�k �`�cW�_�m �Z�x=�wq'�G��#�
a7�<����`���:��|�d}����?���ap      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �     x�}�M��0���)r�"v���t������F�ذ�s�:")��=;K�(?�z�
��n+w����{S�����іq���n�a뛸~��:�`}���G��gXۥ�~o��5e|����oN ���|{b���YA"�\?%/��}��&ʨ`d���*IX!�0�bV�����l���s���6�fe]Ĕ-�R[F�@��*� ����7ãhXy[MS��@4�lqTzCR	;)�	#���k�-A ��")z�v���"#[��*J�:猡�����PT�>������:�@T���:��$iV>P0	�0�BA� �?ǡ���SRǨwxLSb哙ԭ��kf�P��	�y� v���^��:���삻���9ń�v��u�n�ϖ���Q�[��^�Fxry���8�}*HS�˾զ�q�C��珐�O�����)z��M[��)�H��ч�z��8�[U�L�R5�)TL�(�DeDp�_f
h}��V�_b�)����$]�ƗhK��܆al\5}IS@S�x���3�dJ^y=�I���3$KV�̺�ձ
l���:�N7�/��V5���_�B�lv�r�������X=j��)�Oqlw�ʊ�U�U(&�н0��Z�ؑ��'���g�7��+gj�����C5ML�©���%Hv�Gߎ�)�_ǁ�+�& �!�\����g"�\ggV�t�����f�s�){P��i��� ��<��2@�3��6+avg���������D̈́8�0�Q� NxHP� �a�.�]MW��L	��13�����t��rK��}��pL�MF�욪���{7%42�ꏿ���G�ӿ�y��ӯ�y�Aß�YvO=����SB��1��KG���Y2�?G�I>��O�R�����o2冊U�|���:+W��%B��f�.["�T�KP��f>�`��S
����9Ĉ�$���b1h&�)h��GyJd
`ǆ�q��ߧcJ�lq*���2m�SU�ʷY�Q��w� (5
���Z�`�#      �   Y  x��Z�r�H�]�����~h�,Y�R�,y(�&�kz�$!� �HW������,fջ����d��R�&:b"�(��sO��t��Sb�Dd��u"l.%�D�!��ŝk�nS��&[�E}۴�oߖK���䗿�q�U�zs�����DL�wllOڜì��~ݹ�kY��[o\Y��f3�	�+��D]6���'�%�y�O�ȍ�\룡�$`���As����c]��.�����������sX��5uBu��T�c����q����S@�B{�T	m�Ǡ/`0`���frm���c|(�5�ݵ.�X����+��-�1�Ū�|�6���֭��u��������OrA$3�s[5KDaA�Up�|���_uv^��]5��������E"vl/>2�����n��n��-VS���(I�K!��<���((;���e��鷿�)}[�R�M����eW6��k[�=��x ǂ�X���p�Kb���L���_~r�Q`��,�U�����pݛ?�y��/�r%�����W�D�8�H"�
t-& 5�{��=@�<�ʍ�ʈ��޻����u�+Ӳ����!��˂��)9��1��E[��)D�Brb)5�g���0��%�s����	�����F{eS�DcrC�d�Ť�o���_x:a1f�����j���i���?�g�0G��pe�
nC��,�˲?��,�_C�W��n��*W�J<��mn��Bn~��+~5A�?"��˜1im(ljr�U3�@6e=u��P|<1q��kRz�2�w�v�"1L?m�ZU�/)<���Q�9�;��p�"<HG@:��^�f�hn*�y�m�rk7]�M��4�c@��S)��x<^ hb��q*��N���xv6Fӡ&��}�=�s�4�|���8��r��/�������}r�^��͗�\�r�Q`�����nÒ�F�+���HqUѡ��f���bդ(�1*�9eHײW��@U��A��}`�����n��$;Y;���k�E�@HE8Ph9�C��'�+ ��ʕ��K*W�_S�����q�l{���x�j���|����j���}j�v&���c��!yZ")����nON~m�iY 6��t�3��)b5��d9��d�����bA0�[!�р���
���-w>F�v]�)~�<
(᤟L!�c��X��t"�z�5��u���.�]�*�)��X
͂�"��:-p���Zܝ%b�7��bSNQl?��H������V�}	��z�*	Z6K����R�-];]��y=I0�G�o�ݒ{���9�X��rn���N&n[B_�����z�u��O<=K��n(�����q`�Y�4T��W�B�x�n��|��٠���ź�x6����:;0��!	*c�	����+�K���J�����ۦ��� b�jI� �#��XҜ0��'X_�K"����2�#��d���$�ù_ 1������Z���eh�i������i�F��V�;H�`�e����}�C S���
H�R����Z�ep�ܾ[�����jWadN���cH�1��� �W@�,�~�%%U����ߴ�|�8 tDt��#���L>��x��QĈ�T2Wp�0�IU4u�ޢkn�<6_\�u�J-J�x�{�`Uv۱x����X�oYE�	q����Y}��k�,޹j������}��/�ۑp����8�,������۪i� 9u_�K�\[����X-�DĬ��H �2�Yc�p�k�0Ұp�Cn�U�b���m�j>��Q�j$����
��2V� ~q��f2��2*z����'���J�V�U��N�;-p�U"��(�0�8K�dՕ���>�;W��X'��3�7���+ �X*~��������F�tj4�h; ºX.SEE�j�8͉t�yd +FJ�o��Ƀb0�UE��m۠���b�`�'a���P��9P��ˉ�Y�[�`R��T�:�}��I�B�5�a1��Wf��LM�tYaN���1@�P����D�!b��%�}�<���EHV�%�"U����
}k�-y'R1�O�(���9m��Ֆ���̹�C�,�L p�Һ�[)l��ͧ���u�����>ѩc�<);
[	���}/��z���e�̑�cGq+����W��ǳ��(p���Ml�m1�����"���'R���|�<F 2
]�Ӿ�Z���x�w�e������`��a���`E�<�)�&�'����i���U��
F�X%��y#��#�O�8�� �����`�Bi���o,6�W a��~v�â�E���B�x���wE��!^�d���T5��+�#�à�A^��w���l��g'�,e��EXCҎ�$Z�r�����g@z&q�����:�}W*�dۺ����[W7����OϾ�eҪa��2T�� �Mƈ_u��T�����e6�exM&z�V�L2u���~*�o��e?�S�-�lv��b>����`b��p�+9|��f��e��m���]�gWo�/�Ď-��!�䃅w.<���~1���8=��L}@��|�x��a�6���?����E����M������^�=�}�}dħ����z�o��O��y��q��gW�n���zy˨���y�p�����f� j�������u� ���3�1�z��=ݴ�}_�m[~�ޟ͟�1<G�s��<����{�iϻk\�O���dd�"�)�^�q �\��3��7�������;4�W�ͮ�zZ,K/����x���e҂[�h4����-��6oz���8��<����+2���l1��G�����6,޲��:|�3�8�9M��1>��%
�#���=�0C����LfFb,L(
���	{�����e�a�����I���b��	&7��位^k�\68{~��i�X��֞2tu���	�7�A�?�E�bsZF
ڇw��"�����B}�H3�p�|F��k�#yA�����iǎ����T��Kg����'�e�OA����g���,���"�*��sY��?	*{�-�e#����j>,<���u�*+$�k��������l�6ma$`�wwp=����niQ5�i[v[�!�pqsO$��F��2��C7/��ܕ]������m���#K��|�P����শ��C�K��#�*��Sjx$�����C���H�*�f�N�0<9���W����!�%m�����%�oH�l�%v�+�
��Ɇj�B;�G*�^�V��u{��+p�)�}����H��H��/̔aR~;��5��;�|�V�����fWOOӗ4��oYw��b|��E�����|~q}����T�������_���      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �     x���Qn!D��a�@�&�K��a�-�6�r���ش�J��c�`�Sʦ
1���l{aׅ�
��DI3�5�&�w���$�EH�t�Ǯi�̝<uU���)Hȩ�`ҀR��ݬ}?k�e�$m5�D�&`�T%�ֈ��}EL�m�+�m�)$���p�BV��B�v���a�Fε�=��o$�{!�ـ=��#���>1���)���?jT1��5����B��s�Ƌ�+58�F�6�o_�vkyB�L��p�5FrD^F}��7��3      �   �  x����r�0�����}'�J��g�F�UBȑ �߾���&"�������߅������z�aG���Иv���O�}Cr���R���NȞ~�D�m�^��_��F������H�#T&(&ۙqx���-�WCRD�D�6�`��X�5!4��_ԝyӭ����JRƫ*����3j�a;Ӵ)P�E,���GN�]�PFpSC储ֈքA��nbac[n��(P$�Z <N�el�2�<'�ZVf(@H C̉���9�����������Ά`j[.K%E�`��bk�X�D�{��ԇ}	�Y?@o( 3��n�|���X���Kl���ޮ+9n�G
�y��܎]���5E՞��#T�j�Y�c0)*j�_o��u�4�"�1��i�;��!I�4$��jM�OϮ9�a��d=P��o��N�lk#�5��*F(�@�����@j�^fEٳ,{�]�0*/Z\Y�,����,���YLL�F���rӃk��g{[��kG����!�)I�A�K��`� ��'� tʲ��"j�hi�DV����X���<��W��t'Pl�����6��B�R(7k�noܹ9&���q��e�PTMe���al�On���$������Y9��Ԍ����7�����|��;aE��A����8!�k�.f�n��M���T(�)�;/��a���^�-�?��/�	��Ǧ���S�PǍQ^�rˏ�~��0��Y      �   p  x���ˊ�0 �u��/d��@�81��]9�D7~�D��$M����U�P��.!��ý:���:�e;�T�êi�ʾYP9���W#��&ow���`4������;I�h#C�m ���m��q���!9�~��{��uT�����U ޫi�ƫYF�<�T(�5.�h��[K��Ly�����g_9Y��ISlv���)ڸ���{�ط�����G}�Nb_���3���d� �8���Q���b#
��4�s�W�<�`;W��`(�Tm޾�v(�S�i�S��M��Ƴ����7������g�<A�6�5�V0l�~`Y��,������Q}������8)4N�A��΄��L� �1����2�x"<o��ߌD�l&~�|w�ݏ�\����� ���/w=�'h�������\�x��*
������|-���V�K�h��@6�s�X{�kB�Y"Z5\��6��؊���t���S�$�~����AqO�q���S��p��@+˅���^v�����'xv=�r.ghTo^n�}Af]�2�Lƀd�$45��%�c�^�1|�U<H�����}�I��6���ֵ��Ӟ�E~��?c=A���5�V��A�x��X-��_����     