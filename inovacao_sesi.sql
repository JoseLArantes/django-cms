--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 10.1

DO $$ DECLARE
   r RECORD;
BEGIN
   FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
       EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
   END LOOP;
END $$;


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adjustments_adjustments; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE adjustments_adjustments (
    id integer NOT NULL,
    adjustments text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL,
    is_shown boolean NOT NULL
);


ALTER TABLE adjustments_adjustments OWNER TO inovacao_sesi;

--
-- Name: adjustments_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE adjustments_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adjustments_adjustments_id_seq OWNER TO inovacao_sesi;

--
-- Name: adjustments_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE adjustments_adjustments_id_seq OWNED BY adjustments_adjustments.id;


--
-- Name: audience_agerange; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_agerange (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE audience_agerange OWNER TO inovacao_sesi;

--
-- Name: audience_agerange_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_agerange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_agerange_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_agerange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_agerange_id_seq OWNED BY audience_agerange.id;


--
-- Name: audience_entity; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_entity (
    id integer NOT NULL,
    segment_id integer NOT NULL,
    solution_id integer NOT NULL,
    state_id integer,
    user_id integer NOT NULL,
    description text NOT NULL,
    size_id integer,
    region_id integer
);


ALTER TABLE audience_entity OWNER TO inovacao_sesi;

--
-- Name: audience_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_entity_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_entity_id_seq OWNED BY audience_entity.id;


--
-- Name: audience_genre; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_genre (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE audience_genre OWNER TO inovacao_sesi;

--
-- Name: audience_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_genre_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_genre_id_seq OWNED BY audience_genre.id;


--
-- Name: audience_level; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_level (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE audience_level OWNER TO inovacao_sesi;

--
-- Name: audience_level_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_level_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_level_id_seq OWNED BY audience_level.id;


--
-- Name: audience_region; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_region (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE audience_region OWNER TO inovacao_sesi;

--
-- Name: audience_region_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_region_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_region_id_seq OWNED BY audience_region.id;


--
-- Name: audience_type; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE audience_type (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE audience_type OWNER TO inovacao_sesi;

--
-- Name: audience_type_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE audience_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audience_type_id_seq OWNER TO inovacao_sesi;

--
-- Name: audience_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE audience_type_id_seq OWNED BY audience_type.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO inovacao_sesi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO inovacao_sesi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO inovacao_sesi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO inovacao_sesi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO inovacao_sesi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO inovacao_sesi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: buying_companies_company; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE buying_companies_company (
    id integer NOT NULL,
    company_name character varying(256) NOT NULL,
    trading_name character varying(256) NOT NULL,
    cnpj character varying(18) NOT NULL,
    email character varying(256) NOT NULL,
    initial_date date NOT NULL,
    final_date date NOT NULL,
    phone character varying(15),
    name character varying(256),
    cargo character varying(256),
    phone_2 character varying(15),
    name_2 character varying(256),
    cargo_2 character varying(256),
    segment_id integer NOT NULL,
    size_id integer NOT NULL,
    solution_id integer NOT NULL,
    state_id integer,
    user_id integer NOT NULL
);


ALTER TABLE buying_companies_company OWNER TO inovacao_sesi;

--
-- Name: buying_companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE buying_companies_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE buying_companies_company_id_seq OWNER TO inovacao_sesi;

--
-- Name: buying_companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE buying_companies_company_id_seq OWNED BY buying_companies_company.id;


--
-- Name: buying_companies_regional; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE buying_companies_regional (
    id integer NOT NULL,
    date_added timestamp with time zone NOT NULL,
    solution_id integer NOT NULL,
    state_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE buying_companies_regional OWNER TO inovacao_sesi;

--
-- Name: buying_companies_regional_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE buying_companies_regional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE buying_companies_regional_id_seq OWNER TO inovacao_sesi;

--
-- Name: buying_companies_regional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE buying_companies_regional_id_seq OWNED BY buying_companies_regional.id;


--
-- Name: communication_strategy_competitor; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_competitor (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    customizable boolean NOT NULL,
    company_name character varying(256) NOT NULL,
    notes text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    city_id integer NOT NULL,
    income_id integer NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE communication_strategy_competitor OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitor_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_competitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_competitor_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_competitor_id_seq OWNED BY communication_strategy_competitor.id;


--
-- Name: communication_strategy_competitor_market; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_competitor_market (
    id integer NOT NULL,
    competitor_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE communication_strategy_competitor_market OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitor_market_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_competitor_market_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_competitor_market_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitor_market_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_competitor_market_id_seq OWNED BY communication_strategy_competitor_market.id;


--
-- Name: communication_strategy_competitorincome; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_competitorincome (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE communication_strategy_competitorincome OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitorincome_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_competitorincome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_competitorincome_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_competitorincome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_competitorincome_id_seq OWNED BY communication_strategy_competitorincome.id;


--
-- Name: communication_strategy_file; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_file (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    notes text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE communication_strategy_file OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_file_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_file_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_file_id_seq OWNED BY communication_strategy_file.id;


--
-- Name: communication_strategy_resource; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_resource (
    id integer NOT NULL,
    notes text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    solution_id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE communication_strategy_resource OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_resource_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_resource_id_seq OWNED BY communication_strategy_resource.id;


--
-- Name: communication_strategy_resourcetype; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_resourcetype (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE communication_strategy_resourcetype OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_resourcetype_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_resourcetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_resourcetype_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_resourcetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_resourcetype_id_seq OWNED BY communication_strategy_resourcetype.id;


--
-- Name: communication_strategy_strategy; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE communication_strategy_strategy (
    id integer NOT NULL,
    text text NOT NULL,
    video character varying(256),
    notes text,
    solution_id integer NOT NULL,
    user_id integer NOT NULL,
    competitors boolean NOT NULL,
    video_embed text
);


ALTER TABLE communication_strategy_strategy OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_strategy_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE communication_strategy_strategy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communication_strategy_strategy_id_seq OWNER TO inovacao_sesi;

--
-- Name: communication_strategy_strategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE communication_strategy_strategy_id_seq OWNED BY communication_strategy_strategy.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO inovacao_sesi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO inovacao_sesi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO inovacao_sesi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO inovacao_sesi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO inovacao_sesi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO inovacao_sesi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO inovacao_sesi;

--
-- Name: evaluations_drafts_evaluationdraft; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_drafts_evaluationdraft (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    documentation boolean NOT NULL,
    documentation_notes text,
    newasset boolean NOT NULL,
    newasset_notes text,
    scalability boolean NOT NULL,
    scalability_notes text,
    potential boolean NOT NULL,
    potential_notes text,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE evaluations_drafts_evaluationdraft OWNER TO inovacao_sesi;

--
-- Name: evaluations_drafts_evaluationdraft_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_drafts_evaluationdraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_drafts_evaluationdraft_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_drafts_evaluationdraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_drafts_evaluationdraft_id_seq OWNED BY evaluations_drafts_evaluationdraft.id;


--
-- Name: evaluations_drafts_specialistevaluationdraft; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_drafts_specialistevaluationdraft (
    id integer NOT NULL,
    competitors boolean NOT NULL,
    competitors_notes text,
    competitors_notes_2 text,
    competitors_notes_3 text,
    competitors_notes_4 text,
    judgment boolean NOT NULL,
    judgment_notes text,
    date timestamp with time zone NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE evaluations_drafts_specialistevaluationdraft OWNER TO inovacao_sesi;

--
-- Name: evaluations_drafts_specialistevaluationdraft_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_drafts_specialistevaluationdraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_drafts_specialistevaluationdraft_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_drafts_specialistevaluationdraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_drafts_specialistevaluationdraft_id_seq OWNED BY evaluations_drafts_specialistevaluationdraft.id;


--
-- Name: evaluations_evaluation; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_evaluation (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    documentation boolean NOT NULL,
    documentation_notes text NOT NULL,
    newasset boolean NOT NULL,
    newasset_notes text NOT NULL,
    scalability boolean NOT NULL,
    scalability_notes text NOT NULL,
    potential boolean NOT NULL,
    potential_notes text NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE evaluations_evaluation OWNER TO inovacao_sesi;

--
-- Name: evaluations_evaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_evaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_evaluation_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_evaluation_id_seq OWNED BY evaluations_evaluation.id;


--
-- Name: evaluations_invites; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_invites (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    accepted boolean,
    solution_id integer,
    user_id integer,
    date_answered timestamp with time zone
);


ALTER TABLE evaluations_invites OWNER TO inovacao_sesi;

--
-- Name: evaluations_invites_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_invites_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_invites_id_seq OWNED BY evaluations_invites.id;


--
-- Name: evaluations_resultevaluation; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_resultevaluation (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    done boolean NOT NULL,
    notes text,
    result_id integer NOT NULL,
    specialist_evaluation_id integer,
    specialist_evaluation_draft_id integer,
    user_id integer
);


ALTER TABLE evaluations_resultevaluation OWNER TO inovacao_sesi;

--
-- Name: evaluations_resultevaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_resultevaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_resultevaluation_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_resultevaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_resultevaluation_id_seq OWNED BY evaluations_resultevaluation.id;


--
-- Name: evaluations_specialistevaluation; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_specialistevaluation (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    competitors boolean NOT NULL,
    competitors_notes text NOT NULL,
    competitors_notes_2 text NOT NULL,
    competitors_notes_3 text NOT NULL,
    competitors_notes_4 text NOT NULL,
    judgment boolean NOT NULL,
    judgment_notes text NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE evaluations_specialistevaluation OWNER TO inovacao_sesi;

--
-- Name: evaluations_specialistevaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_specialistevaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_specialistevaluation_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_specialistevaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_specialistevaluation_id_seq OWNED BY evaluations_specialistevaluation.id;


--
-- Name: evaluations_stepevaluation; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evaluations_stepevaluation (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    done boolean NOT NULL,
    notes text,
    specialist_evaluation_id integer,
    step_id integer NOT NULL,
    specialist_evaluation_draft_id integer,
    user_id integer
);


ALTER TABLE evaluations_stepevaluation OWNER TO inovacao_sesi;

--
-- Name: evaluations_stepevaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evaluations_stepevaluation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluations_stepevaluation_id_seq OWNER TO inovacao_sesi;

--
-- Name: evaluations_stepevaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evaluations_stepevaluation_id_seq OWNED BY evaluations_stepevaluation.id;


--
-- Name: evidences_evidence; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE evidences_evidence (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    notes text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    object_id integer,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT evidences_evidence_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE evidences_evidence OWNER TO inovacao_sesi;

--
-- Name: evidences_evidence_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE evidences_evidence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evidences_evidence_id_seq OWNER TO inovacao_sesi;

--
-- Name: evidences_evidence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE evidences_evidence_id_seq OWNED BY evidences_evidence.id;


--
-- Name: execution_plan_step; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE execution_plan_step (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    description text NOT NULL,
    "order" integer NOT NULL,
    user_id integer NOT NULL,
    solution_id integer NOT NULL,
    duration integer NOT NULL,
    planning_duration integer NOT NULL
);


ALTER TABLE execution_plan_step OWNER TO inovacao_sesi;

--
-- Name: execution_plan_step_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE execution_plan_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE execution_plan_step_id_seq OWNER TO inovacao_sesi;

--
-- Name: execution_plan_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE execution_plan_step_id_seq OWNED BY execution_plan_step.id;


--
-- Name: expenses_and_revenues_cost; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE expenses_and_revenues_cost (
    id integer NOT NULL,
    value numeric(99,2) NOT NULL,
    notes text NOT NULL,
    solution_id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE expenses_and_revenues_cost OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE expenses_and_revenues_cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_and_revenues_cost_id_seq OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE expenses_and_revenues_cost_id_seq OWNED BY expenses_and_revenues_cost.id;


--
-- Name: expenses_and_revenues_costtype; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE expenses_and_revenues_costtype (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE expenses_and_revenues_costtype OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_costtype_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE expenses_and_revenues_costtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_and_revenues_costtype_id_seq OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_costtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE expenses_and_revenues_costtype_id_seq OWNED BY expenses_and_revenues_costtype.id;


--
-- Name: expenses_and_revenues_revenue; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE expenses_and_revenues_revenue (
    id integer NOT NULL,
    value numeric(99,2) NOT NULL,
    notes text NOT NULL,
    solution_id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL,
    bid_details text NOT NULL,
    negotiation_details text NOT NULL
);


ALTER TABLE expenses_and_revenues_revenue OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_income_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE expenses_and_revenues_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_and_revenues_income_id_seq OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE expenses_and_revenues_income_id_seq OWNED BY expenses_and_revenues_revenue.id;


--
-- Name: expenses_and_revenues_revenuetype; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE expenses_and_revenues_revenuetype (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE expenses_and_revenues_revenuetype OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_incometype_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE expenses_and_revenues_incometype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_and_revenues_incometype_id_seq OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_incometype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE expenses_and_revenues_incometype_id_seq OWNED BY expenses_and_revenues_revenuetype.id;


--
-- Name: expenses_and_revenues_value; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE expenses_and_revenues_value (
    id integer NOT NULL,
    value numeric(11,2) NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE expenses_and_revenues_value OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_value_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE expenses_and_revenues_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_and_revenues_value_id_seq OWNER TO inovacao_sesi;

--
-- Name: expenses_and_revenues_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE expenses_and_revenues_value_id_seq OWNED BY expenses_and_revenues_value.id;


--
-- Name: faq_faq; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE faq_faq (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    answer text NOT NULL
);


ALTER TABLE faq_faq OWNER TO inovacao_sesi;

--
-- Name: faq_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE faq_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE faq_faq_id_seq OWNER TO inovacao_sesi;

--
-- Name: faq_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE faq_faq_id_seq OWNED BY faq_faq.id;


--
-- Name: geodata_city; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE geodata_city (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    code character varying(256) NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE geodata_city OWNER TO inovacao_sesi;

--
-- Name: geodata_city_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE geodata_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geodata_city_id_seq OWNER TO inovacao_sesi;

--
-- Name: geodata_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE geodata_city_id_seq OWNED BY geodata_city.id;


--
-- Name: geodata_country; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE geodata_country (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    code character varying(256) NOT NULL,
    "default" boolean NOT NULL
);


ALTER TABLE geodata_country OWNER TO inovacao_sesi;

--
-- Name: geodata_country_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE geodata_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geodata_country_id_seq OWNER TO inovacao_sesi;

--
-- Name: geodata_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE geodata_country_id_seq OWNED BY geodata_country.id;


--
-- Name: geodata_state; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE geodata_state (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    code character varying(256) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE geodata_state OWNER TO inovacao_sesi;

--
-- Name: geodata_state_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE geodata_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geodata_state_id_seq OWNER TO inovacao_sesi;

--
-- Name: geodata_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE geodata_state_id_seq OWNED BY geodata_state.id;


--
-- Name: marketing_company; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_company (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    segment_id integer NOT NULL,
    solution_id integer NOT NULL,
    state_id integer
);


ALTER TABLE marketing_company OWNER TO inovacao_sesi;

--
-- Name: marketing_company_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_company_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_company_id_seq OWNED BY marketing_company.id;


--
-- Name: marketing_pilotcompany; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_pilotcompany (
    id integer NOT NULL,
    company_name character varying(256) NOT NULL,
    trading_name character varying(256) NOT NULL,
    cnpj character varying(18) NOT NULL,
    segment_id integer NOT NULL,
    size_id integer NOT NULL,
    solution_id integer NOT NULL,
    state_id integer
);


ALTER TABLE marketing_pilotcompany OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotcompany_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_pilotcompany_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_pilotcompany_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotcompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_pilotcompany_id_seq OWNED BY marketing_pilotcompany.id;


--
-- Name: marketing_pilotcompanycontact; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_pilotcompanycontact (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    occupation character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    phone character varying(16) NOT NULL,
    pilot_company_id integer NOT NULL
);


ALTER TABLE marketing_pilotcompanycontact OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotcompanycontact_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_pilotcompanycontact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_pilotcompanycontact_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotcompanycontact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_pilotcompanycontact_id_seq OWNED BY marketing_pilotcompanycontact.id;


--
-- Name: marketing_pilotresults; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_pilotresults (
    id integer NOT NULL,
    results text NOT NULL,
    pilot_company_id integer NOT NULL
);


ALTER TABLE marketing_pilotresults OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotresults_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_pilotresults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_pilotresults_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_pilotresults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_pilotresults_id_seq OWNED BY marketing_pilotresults.id;


--
-- Name: marketing_technologytransfer; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_technologytransfer (
    id integer NOT NULL,
    can_coperform boolean NOT NULL,
    can_sell_rights boolean NOT NULL,
    can_hire boolean NOT NULL,
    solution_id integer NOT NULL
);


ALTER TABLE marketing_technologytransfer OWNER TO inovacao_sesi;

--
-- Name: marketing_technologytransfer_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_technologytransfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_technologytransfer_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_technologytransfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_technologytransfer_id_seq OWNED BY marketing_technologytransfer.id;


--
-- Name: marketing_unlistedreferencefile; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE marketing_unlistedreferencefile (
    id integer NOT NULL,
    observation character varying(255) NOT NULL,
    solution_id integer
);


ALTER TABLE marketing_unlistedreferencefile OWNER TO inovacao_sesi;

--
-- Name: marketing_unlistedreferencefile_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE marketing_unlistedreferencefile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketing_unlistedreferencefile_id_seq OWNER TO inovacao_sesi;

--
-- Name: marketing_unlistedreferencefile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE marketing_unlistedreferencefile_id_seq OWNED BY marketing_unlistedreferencefile.id;


--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE profiles_profile (
    id integer NOT NULL,
    phone character varying(256),
    cargo character varying(256),
    category_id integer,
    regional_id integer,
    user_id integer NOT NULL
);


ALTER TABLE profiles_profile OWNER TO inovacao_sesi;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE profiles_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_profile_id_seq OWNER TO inovacao_sesi;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE profiles_profile_id_seq OWNED BY profiles_profile.id;


--
-- Name: received_messages_receivedmessage; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE received_messages_receivedmessage (
    send_date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    company character varying(256) NOT NULL,
    phone character varying(256) NOT NULL,
    contact_method character varying(256) NOT NULL,
    message text NOT NULL,
    returned boolean NOT NULL,
    readed boolean NOT NULL,
    category_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE received_messages_receivedmessage OWNER TO inovacao_sesi;

--
-- Name: received_messages_receivedmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE received_messages_receivedmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE received_messages_receivedmessage_id_seq OWNER TO inovacao_sesi;

--
-- Name: received_messages_receivedmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE received_messages_receivedmessage_id_seq OWNED BY received_messages_receivedmessage.id;


--
-- Name: references_reference; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE references_reference (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    occupation character varying(256) NOT NULL,
    phone character varying(16) NOT NULL,
    email character varying(256) NOT NULL,
    solution_id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE references_reference OWNER TO inovacao_sesi;

--
-- Name: references_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE references_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE references_reference_id_seq OWNER TO inovacao_sesi;

--
-- Name: references_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE references_reference_id_seq OWNED BY references_reference.id;


--
-- Name: references_type; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE references_type (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE references_type OWNER TO inovacao_sesi;

--
-- Name: references_type_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE references_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE references_type_id_seq OWNER TO inovacao_sesi;

--
-- Name: references_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE references_type_id_seq OWNED BY references_type.id;


--
-- Name: results_result; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE results_result (
    id integer NOT NULL,
    description text NOT NULL,
    impact_deadline character varying(256) NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    step_id integer
);


ALTER TABLE results_result OWNER TO inovacao_sesi;

--
-- Name: results_result_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE results_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_result_id_seq OWNER TO inovacao_sesi;

--
-- Name: results_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE results_result_id_seq OWNED BY results_result.id;


--
-- Name: results_resulttype; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE results_resulttype (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE results_resulttype OWNER TO inovacao_sesi;

--
-- Name: results_resulttype_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE results_resulttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_resulttype_id_seq OWNER TO inovacao_sesi;

--
-- Name: results_resulttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE results_resulttype_id_seq OWNED BY results_resulttype.id;


--
-- Name: solutions_action; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_action (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    namespace character varying(256) NOT NULL,
    status_id integer NOT NULL,
    "order" integer NOT NULL,
    icon_class character varying(256),
    is_modal boolean NOT NULL,
    modal_file character varying(256),
    modal_id character varying(256),
    permission_id integer,
    active boolean NOT NULL,
    next_status_id integer,
    solution_field_name character varying(256),
    solution_field_value character varying(256),
    success_message character varying(256) NOT NULL
);


ALTER TABLE solutions_action OWNER TO inovacao_sesi;

--
-- Name: solutions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_action_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_action_id_seq OWNED BY solutions_action.id;


--
-- Name: solutions_category; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_category (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    icon_class character varying(256)
);


ALTER TABLE solutions_category OWNER TO inovacao_sesi;

--
-- Name: solutions_category_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_category_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_category_id_seq OWNED BY solutions_category.id;


--
-- Name: solutions_contactrequest; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_contactrequest (
    id integer NOT NULL,
    date_added timestamp with time zone NOT NULL,
    name character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    phone character varying(15) NOT NULL,
    solution_id integer NOT NULL,
    uf_id integer NOT NULL,
    returned boolean NOT NULL
);


ALTER TABLE solutions_contactrequest OWNER TO inovacao_sesi;

--
-- Name: solutions_contactrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_contactrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_contactrequest_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_contactrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_contactrequest_id_seq OWNED BY solutions_contactrequest.id;


--
-- Name: solutions_region; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_region (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE solutions_region OWNER TO inovacao_sesi;

--
-- Name: solutions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_region_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_region_id_seq OWNED BY solutions_region.id;


--
-- Name: solutions_segment; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_segment (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE solutions_segment OWNER TO inovacao_sesi;

--
-- Name: solutions_segment_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_segment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_segment_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_segment_id_seq OWNED BY solutions_segment.id;


--
-- Name: solutions_size; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_size (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL
);


ALTER TABLE solutions_size OWNER TO inovacao_sesi;

--
-- Name: solutions_size_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_size_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_size_id_seq OWNED BY solutions_size.id;


--
-- Name: solutions_solution; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_solution (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    motivation text NOT NULL,
    goal_general text NOT NULL,
    goal_specific text NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    banner character varying(100),
    extra_expenses text,
    can_reach_others text,
    can_create_new_services text,
    desc_methodology text,
    template character varying(256),
    can_reach_other_types boolean NOT NULL,
    future_services boolean NOT NULL,
    impact_evaluation boolean NOT NULL,
    mapped_companies boolean NOT NULL,
    unlisted_documentation boolean NOT NULL,
    segment_id integer,
    size_id integer,
    active boolean NOT NULL,
    is_approved boolean NOT NULL,
    is_premium boolean NOT NULL,
    is_rejected boolean NOT NULL
);


ALTER TABLE solutions_solution OWNER TO inovacao_sesi;

--
-- Name: solutions_solution_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_solution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_solution_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_solution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_solution_id_seq OWNED BY solutions_solution.id;


--
-- Name: solutions_solutionstatus; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_solutionstatus (
    date_added timestamp with time zone NOT NULL,
    id integer NOT NULL,
    solution_id integer NOT NULL,
    status_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE solutions_solutionstatus OWNER TO inovacao_sesi;

--
-- Name: solutions_solutionstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_solutionstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_solutionstatus_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_solutionstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_solutionstatus_id_seq OWNED BY solutions_solutionstatus.id;


--
-- Name: solutions_status; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE solutions_status (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    slug character varying(256) NOT NULL,
    "order" integer NOT NULL,
    allow_update boolean NOT NULL,
    show_adjustments boolean NOT NULL,
    next_status_id integer
);


ALTER TABLE solutions_status OWNER TO inovacao_sesi;

--
-- Name: solutions_status_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE solutions_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solutions_status_id_seq OWNER TO inovacao_sesi;

--
-- Name: solutions_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE solutions_status_id_seq OWNED BY solutions_status.id;


--
-- Name: surveys_answer; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE surveys_answer (
    id integer NOT NULL,
    text text,
    "order" integer NOT NULL,
    points integer,
    question_id integer NOT NULL
);


ALTER TABLE surveys_answer OWNER TO inovacao_sesi;

--
-- Name: surveys_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE surveys_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_answer_id_seq OWNER TO inovacao_sesi;

--
-- Name: surveys_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE surveys_answer_id_seq OWNED BY surveys_answer.id;


--
-- Name: surveys_question; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE surveys_question (
    id integer NOT NULL,
    text character varying(256) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE surveys_question OWNER TO inovacao_sesi;

--
-- Name: surveys_question_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE surveys_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_question_id_seq OWNER TO inovacao_sesi;

--
-- Name: surveys_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE surveys_question_id_seq OWNED BY surveys_question.id;


--
-- Name: surveys_survey; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE surveys_survey (
    date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE surveys_survey OWNER TO inovacao_sesi;

--
-- Name: surveys_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE surveys_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_survey_id_seq OWNER TO inovacao_sesi;

--
-- Name: surveys_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE surveys_survey_id_seq OWNED BY surveys_survey.id;


--
-- Name: surveys_useranswer; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE surveys_useranswer (
    date_added timestamp with time zone NOT NULL,
    id integer NOT NULL,
    answer_id integer NOT NULL,
    survey_id integer NOT NULL
);


ALTER TABLE surveys_useranswer OWNER TO inovacao_sesi;

--
-- Name: surveys_useranswer_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE surveys_useranswer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_useranswer_id_seq OWNER TO inovacao_sesi;

--
-- Name: surveys_useranswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE surveys_useranswer_id_seq OWNED BY surveys_useranswer.id;


--
-- Name: testimonials_testimonial; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE testimonials_testimonial (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    occupation character varying(256) NOT NULL,
    date date NOT NULL,
    testimonial text NOT NULL,
    video character varying(256),
    picture character varying(100) NOT NULL,
    "authorization" character varying(100) NOT NULL,
    solution_id integer NOT NULL,
    user_id integer NOT NULL,
    company character varying(255) NOT NULL,
    video_embed text
);


ALTER TABLE testimonials_testimonial OWNER TO inovacao_sesi;

--
-- Name: testimonials_testimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE testimonials_testimonial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE testimonials_testimonial_id_seq OWNER TO inovacao_sesi;

--
-- Name: testimonials_testimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE testimonials_testimonial_id_seq OWNED BY testimonials_testimonial.id;


--
-- Name: users_groupextend; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE users_groupextend (
    id integer NOT NULL,
    slug character varying(256) NOT NULL,
    group_id integer NOT NULL,
    ranking integer NOT NULL
);


ALTER TABLE users_groupextend OWNER TO inovacao_sesi;

--
-- Name: users_groupextend_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE users_groupextend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_groupextend_id_seq OWNER TO inovacao_sesi;

--
-- Name: users_groupextend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE users_groupextend_id_seq OWNED BY users_groupextend.id;


--
-- Name: users_historicaluser; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE users_historicaluser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(256) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_add timestamp with time zone NOT NULL,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    history_user_id integer,
    user_id integer,
    name_first character varying(256) NOT NULL
);


ALTER TABLE users_historicaluser OWNER TO inovacao_sesi;

--
-- Name: users_historicaluser_history_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE users_historicaluser_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_historicaluser_history_id_seq OWNER TO inovacao_sesi;

--
-- Name: users_historicaluser_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE users_historicaluser_history_id_seq OWNED BY users_historicaluser.history_id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(256) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_add timestamp with time zone NOT NULL,
    user_id integer,
    name_first character varying(256) NOT NULL
);


ALTER TABLE users_user OWNER TO inovacao_sesi;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_user_groups OWNER TO inovacao_sesi;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_groups_id_seq OWNER TO inovacao_sesi;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE users_user_groups_id_seq OWNED BY users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO inovacao_sesi;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE users_user_id_seq OWNED BY users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: inovacao_sesi
--

CREATE TABLE users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE users_user_user_permissions OWNER TO inovacao_sesi;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: inovacao_sesi
--

CREATE SEQUENCE users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_user_permissions_id_seq OWNER TO inovacao_sesi;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inovacao_sesi
--

ALTER SEQUENCE users_user_user_permissions_id_seq OWNED BY users_user_user_permissions.id;


--
-- Name: adjustments_adjustments id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY adjustments_adjustments ALTER COLUMN id SET DEFAULT nextval('adjustments_adjustments_id_seq'::regclass);


--
-- Name: audience_agerange id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_agerange ALTER COLUMN id SET DEFAULT nextval('audience_agerange_id_seq'::regclass);


--
-- Name: audience_entity id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity ALTER COLUMN id SET DEFAULT nextval('audience_entity_id_seq'::regclass);


--
-- Name: audience_genre id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_genre ALTER COLUMN id SET DEFAULT nextval('audience_genre_id_seq'::regclass);


--
-- Name: audience_level id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_level ALTER COLUMN id SET DEFAULT nextval('audience_level_id_seq'::regclass);


--
-- Name: audience_region id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_region ALTER COLUMN id SET DEFAULT nextval('audience_region_id_seq'::regclass);


--
-- Name: audience_type id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_type ALTER COLUMN id SET DEFAULT nextval('audience_type_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: buying_companies_company id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company ALTER COLUMN id SET DEFAULT nextval('buying_companies_company_id_seq'::regclass);


--
-- Name: buying_companies_regional id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_regional ALTER COLUMN id SET DEFAULT nextval('buying_companies_regional_id_seq'::regclass);


--
-- Name: communication_strategy_competitor id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor ALTER COLUMN id SET DEFAULT nextval('communication_strategy_competitor_id_seq'::regclass);


--
-- Name: communication_strategy_competitor_market id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor_market ALTER COLUMN id SET DEFAULT nextval('communication_strategy_competitor_market_id_seq'::regclass);


--
-- Name: communication_strategy_competitorincome id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitorincome ALTER COLUMN id SET DEFAULT nextval('communication_strategy_competitorincome_id_seq'::regclass);


--
-- Name: communication_strategy_file id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_file ALTER COLUMN id SET DEFAULT nextval('communication_strategy_file_id_seq'::regclass);


--
-- Name: communication_strategy_resource id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resource ALTER COLUMN id SET DEFAULT nextval('communication_strategy_resource_id_seq'::regclass);


--
-- Name: communication_strategy_resourcetype id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resourcetype ALTER COLUMN id SET DEFAULT nextval('communication_strategy_resourcetype_id_seq'::regclass);


--
-- Name: communication_strategy_strategy id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_strategy ALTER COLUMN id SET DEFAULT nextval('communication_strategy_strategy_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: evaluations_drafts_evaluationdraft id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_evaluationdraft ALTER COLUMN id SET DEFAULT nextval('evaluations_drafts_evaluationdraft_id_seq'::regclass);


--
-- Name: evaluations_drafts_specialistevaluationdraft id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_specialistevaluationdraft ALTER COLUMN id SET DEFAULT nextval('evaluations_drafts_specialistevaluationdraft_id_seq'::regclass);


--
-- Name: evaluations_evaluation id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_evaluation ALTER COLUMN id SET DEFAULT nextval('evaluations_evaluation_id_seq'::regclass);


--
-- Name: evaluations_invites id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_invites ALTER COLUMN id SET DEFAULT nextval('evaluations_invites_id_seq'::regclass);


--
-- Name: evaluations_resultevaluation id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation ALTER COLUMN id SET DEFAULT nextval('evaluations_resultevaluation_id_seq'::regclass);


--
-- Name: evaluations_specialistevaluation id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_specialistevaluation ALTER COLUMN id SET DEFAULT nextval('evaluations_specialistevaluation_id_seq'::regclass);


--
-- Name: evaluations_stepevaluation id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation ALTER COLUMN id SET DEFAULT nextval('evaluations_stepevaluation_id_seq'::regclass);


--
-- Name: evidences_evidence id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evidences_evidence ALTER COLUMN id SET DEFAULT nextval('evidences_evidence_id_seq'::regclass);


--
-- Name: execution_plan_step id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY execution_plan_step ALTER COLUMN id SET DEFAULT nextval('execution_plan_step_id_seq'::regclass);


--
-- Name: expenses_and_revenues_cost id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_cost ALTER COLUMN id SET DEFAULT nextval('expenses_and_revenues_cost_id_seq'::regclass);


--
-- Name: expenses_and_revenues_costtype id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_costtype ALTER COLUMN id SET DEFAULT nextval('expenses_and_revenues_costtype_id_seq'::regclass);


--
-- Name: expenses_and_revenues_revenue id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenue ALTER COLUMN id SET DEFAULT nextval('expenses_and_revenues_income_id_seq'::regclass);


--
-- Name: expenses_and_revenues_revenuetype id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenuetype ALTER COLUMN id SET DEFAULT nextval('expenses_and_revenues_incometype_id_seq'::regclass);


--
-- Name: expenses_and_revenues_value id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_value ALTER COLUMN id SET DEFAULT nextval('expenses_and_revenues_value_id_seq'::regclass);


--
-- Name: faq_faq id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY faq_faq ALTER COLUMN id SET DEFAULT nextval('faq_faq_id_seq'::regclass);


--
-- Name: geodata_city id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_city ALTER COLUMN id SET DEFAULT nextval('geodata_city_id_seq'::regclass);


--
-- Name: geodata_country id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_country ALTER COLUMN id SET DEFAULT nextval('geodata_country_id_seq'::regclass);


--
-- Name: geodata_state id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_state ALTER COLUMN id SET DEFAULT nextval('geodata_state_id_seq'::regclass);


--
-- Name: marketing_company id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_company ALTER COLUMN id SET DEFAULT nextval('marketing_company_id_seq'::regclass);


--
-- Name: marketing_pilotcompany id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany ALTER COLUMN id SET DEFAULT nextval('marketing_pilotcompany_id_seq'::regclass);


--
-- Name: marketing_pilotcompanycontact id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompanycontact ALTER COLUMN id SET DEFAULT nextval('marketing_pilotcompanycontact_id_seq'::regclass);


--
-- Name: marketing_pilotresults id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotresults ALTER COLUMN id SET DEFAULT nextval('marketing_pilotresults_id_seq'::regclass);


--
-- Name: marketing_technologytransfer id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_technologytransfer ALTER COLUMN id SET DEFAULT nextval('marketing_technologytransfer_id_seq'::regclass);


--
-- Name: marketing_unlistedreferencefile id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_unlistedreferencefile ALTER COLUMN id SET DEFAULT nextval('marketing_unlistedreferencefile_id_seq'::regclass);


--
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile ALTER COLUMN id SET DEFAULT nextval('profiles_profile_id_seq'::regclass);


--
-- Name: received_messages_receivedmessage id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY received_messages_receivedmessage ALTER COLUMN id SET DEFAULT nextval('received_messages_receivedmessage_id_seq'::regclass);


--
-- Name: references_reference id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_reference ALTER COLUMN id SET DEFAULT nextval('references_reference_id_seq'::regclass);


--
-- Name: references_type id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_type ALTER COLUMN id SET DEFAULT nextval('references_type_id_seq'::regclass);


--
-- Name: results_result id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result ALTER COLUMN id SET DEFAULT nextval('results_result_id_seq'::regclass);


--
-- Name: results_resulttype id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_resulttype ALTER COLUMN id SET DEFAULT nextval('results_resulttype_id_seq'::regclass);


--
-- Name: solutions_action id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action ALTER COLUMN id SET DEFAULT nextval('solutions_action_id_seq'::regclass);


--
-- Name: solutions_category id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_category ALTER COLUMN id SET DEFAULT nextval('solutions_category_id_seq'::regclass);


--
-- Name: solutions_contactrequest id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_contactrequest ALTER COLUMN id SET DEFAULT nextval('solutions_contactrequest_id_seq'::regclass);


--
-- Name: solutions_region id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_region ALTER COLUMN id SET DEFAULT nextval('solutions_region_id_seq'::regclass);


--
-- Name: solutions_segment id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_segment ALTER COLUMN id SET DEFAULT nextval('solutions_segment_id_seq'::regclass);


--
-- Name: solutions_size id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_size ALTER COLUMN id SET DEFAULT nextval('solutions_size_id_seq'::regclass);


--
-- Name: solutions_solution id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution ALTER COLUMN id SET DEFAULT nextval('solutions_solution_id_seq'::regclass);


--
-- Name: solutions_solutionstatus id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solutionstatus ALTER COLUMN id SET DEFAULT nextval('solutions_solutionstatus_id_seq'::regclass);


--
-- Name: solutions_status id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_status ALTER COLUMN id SET DEFAULT nextval('solutions_status_id_seq'::regclass);


--
-- Name: surveys_answer id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_answer ALTER COLUMN id SET DEFAULT nextval('surveys_answer_id_seq'::regclass);


--
-- Name: surveys_question id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_question ALTER COLUMN id SET DEFAULT nextval('surveys_question_id_seq'::regclass);


--
-- Name: surveys_survey id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_survey ALTER COLUMN id SET DEFAULT nextval('surveys_survey_id_seq'::regclass);


--
-- Name: surveys_useranswer id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_useranswer ALTER COLUMN id SET DEFAULT nextval('surveys_useranswer_id_seq'::regclass);


--
-- Name: testimonials_testimonial id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY testimonials_testimonial ALTER COLUMN id SET DEFAULT nextval('testimonials_testimonial_id_seq'::regclass);


--
-- Name: users_groupextend id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_groupextend ALTER COLUMN id SET DEFAULT nextval('users_groupextend_id_seq'::regclass);


--
-- Name: users_historicaluser history_id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_historicaluser ALTER COLUMN history_id SET DEFAULT nextval('users_historicaluser_history_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user ALTER COLUMN id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_groups ALTER COLUMN id SET DEFAULT nextval('users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: adjustments_adjustments; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY adjustments_adjustments (id, adjustments, date_added, solution_id, user_id, is_shown) FROM stdin;
\.


--
-- Data for Name: audience_agerange; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_agerange (id, name, slug) FROM stdin;
\.


--
-- Data for Name: audience_entity; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_entity (id, segment_id, solution_id, state_id, user_id, description, size_id, region_id) FROM stdin;
\.


--
-- Data for Name: audience_genre; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_genre (id, name, slug) FROM stdin;
\.


--
-- Data for Name: audience_level; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_level (id, name, slug) FROM stdin;
\.


--
-- Data for Name: audience_region; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_region (id, name, slug) FROM stdin;
1	Região Norte	regiao-norte
2	Região Nordeste	regiao-nordeste
3	Região Centro-Oeste	regiao-centro-oeste
4	Região Sudeste	regiao-sudeste
5	Região Sul	regiao-sul
\.


--
-- Data for Name: audience_type; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY audience_type (id, name, slug) FROM stdin;
1	Individual	individual
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY auth_group (id, name) FROM stdin;
5	Especialistas
6	Profissionais Referência
4	Departamento Regional
3	DR Master
2	Departamento Nacional
1	DN Master
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	42
2	1	34
3	1	37
4	1	38
5	1	41
6	1	25
7	1	26
8	1	28
9	1	29
10	1	30
11	2	34
12	2	37
13	2	38
14	2	41
15	2	25
16	2	26
17	2	28
18	2	29
19	2	30
20	3	43
21	3	35
22	3	36
23	3	38
24	3	39
27	3	22
28	3	23
29	3	24
30	3	25
31	3	59
32	3	60
33	3	61
34	4	35
35	4	36
36	4	38
37	4	39
40	4	22
41	4	23
42	4	24
43	4	25
44	4	59
45	4	60
46	4	61
47	5	32
48	5	33
49	5	31
50	5	25
51	6	25
52	6	27
53	4	96
54	4	97
55	4	98
56	4	132
57	4	133
58	4	134
59	4	167
60	4	138
61	4	139
62	4	140
63	4	165
64	4	78
65	4	79
66	4	80
67	4	90
68	4	91
69	4	92
70	4	166
71	3	96
72	3	97
73	3	98
74	3	132
75	3	133
76	3	134
77	3	167
78	3	138
79	3	139
80	3	140
81	3	165
82	3	78
83	3	79
84	3	80
85	3	90
86	3	91
87	3	92
88	3	166
89	4	209
90	3	209
91	2	208
92	2	207
93	1	208
94	1	207
95	2	40
96	1	40
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Ajuste	1	add_adjustments
2	Can change Ajuste	1	change_adjustments
3	Can delete Ajuste	1	delete_adjustments
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add Categoria	6	add_category
17	Can change Categoria	6	change_category
18	Can delete Categoria	6	delete_category
19	Can add Segmento	7	add_segment
20	Can change Segmento	7	change_segment
21	Can delete Segmento	7	delete_segment
22	Can add Solução	8	add_solution
23	Can change Solução	8	change_solution
24	Can delete Solução	8	delete_solution
25	Can view Solution	8	view_solution
26	Can send solution to survey	8	start_survey
27	Can answer survey	8	answer_survey
28	Can answer DN evaluation	8	answer_evaluation
29	Can ask to adjusts in solution	8	ask_adjusts
30	Can send solution to specialist evaluation	8	start_evaluation
31	Can accept evaluation request	8	accept_evaluation
32	Can decline evaluation request	8	decline_evaluation
33	Can answer specialist evaluation	8	answer_specialist_evaluation
34	Can register users	8	register_users
35	Can see acquired solutions	8	see_acquired_solutions
36	Can see buying companies	8	see_buying_companies
37	Can see performance panel	8	see_performance_panel
38	Can see DN evaluation	8	see_dn_evaluation
39	Can see contact requests	8	see_contact_requests
40	Can see received messages	8	see_received_messages
41	Can receive challenge	8	receive_challenge
42	Can administer DN	8	admin_dn
43	Can administer DR	8	admin_dr
44	Can add Porte	9	add_size
45	Can change Porte	9	change_size
46	Can delete Porte	9	delete_size
47	Can add Regional	10	add_region
48	Can change Regional	10	change_region
49	Can delete Regional	10	delete_region
50	Can add Histórico de status da solução	11	add_solutionstatus
51	Can change Histórico de status da solução	11	change_solutionstatus
52	Can delete Histórico de status da solução	11	delete_solutionstatus
53	Can add Ação	12	add_action
54	Can change Ação	12	change_action
55	Can delete Ação	12	delete_action
56	Can add Status	13	add_status
57	Can change Status	13	change_status
58	Can delete Status	13	delete_status
59	Can add Usuário	14	add_user
60	Can change Usuário	14	change_user
61	Can delete Usuário	14	delete_user
62	Can see Usuário	14	view_user
63	Can add historical Usuário	15	add_historicaluser
64	Can change historical Usuário	15	change_historicaluser
65	Can delete historical Usuário	15	delete_historicaluser
66	Can add Faixa etária	16	add_agerange
67	Can change Faixa etária	16	change_agerange
68	Can delete Faixa etária	16	delete_agerange
69	Can add Nível	17	add_level
70	Can change Nível	17	change_level
71	Can delete Nível	17	delete_level
72	Can add Region	18	add_region
73	Can change Region	18	change_region
74	Can delete Region	18	delete_region
75	Can add Tipo	19	add_type
76	Can change Tipo	19	change_type
77	Can delete Tipo	19	delete_type
78	Can add Resultado	20	add_entity
79	Can change Resultado	20	change_entity
80	Can delete Resultado	20	delete_entity
81	Can add Gênero	21	add_genre
82	Can change Gênero	21	change_genre
83	Can delete Gênero	21	delete_genre
84	Can add Regional	22	add_regional
85	Can change Regional	22	change_regional
86	Can delete Regional	22	delete_regional
87	Can add Empresa compradora	23	add_company
88	Can change Empresa compradora	23	change_company
89	Can delete Empresa compradora	23	delete_company
90	Can add Concorrente	24	add_competitor
91	Can change Concorrente	24	change_competitor
92	Can delete Concorrente	24	delete_competitor
93	Can add Recurso	25	add_resource
94	Can change Recurso	25	change_resource
95	Can delete Recurso	25	delete_resource
96	Can add Estratégia de comunicação e abordagem	26	add_strategy
97	Can change Estratégia de comunicação e abordagem	26	change_strategy
98	Can delete Estratégia de comunicação e abordagem	26	delete_strategy
99	Can add tipo de recurso	27	add_resourcetype
100	Can change tipo de recurso	27	change_resourcetype
101	Can delete tipo de recurso	27	delete_resourcetype
102	Can add Arquivo	28	add_file
103	Can change Arquivo	28	change_file
104	Can delete Arquivo	28	delete_file
105	Can add Porte	29	add_competitorincome
106	Can change Porte	29	change_competitorincome
107	Can delete Porte	29	delete_competitorincome
108	Can add avaliação	30	add_evaluation
109	Can change avaliação	30	change_evaluation
110	Can delete avaliação	30	delete_evaluation
111	Can add avaliação	31	add_specialistevaluation
112	Can change avaliação	31	change_specialistevaluation
113	Can delete avaliação	31	delete_specialistevaluation
114	Can add avaliação de resultado	32	add_resultevaluation
115	Can change avaliação de resultado	32	change_resultevaluation
116	Can delete avaliação de resultado	32	delete_resultevaluation
117	Can add convite	33	add_invites
118	Can change convite	33	change_invites
119	Can delete convite	33	delete_invites
120	Can add avaliação de etapa	34	add_stepevaluation
121	Can change avaliação de etapa	34	change_stepevaluation
122	Can delete avaliação de etapa	34	delete_stepevaluation
123	Can add rascunho de avaliação	35	add_evaluationdraft
124	Can change rascunho de avaliação	35	change_evaluationdraft
125	Can delete rascunho de avaliação	35	delete_evaluationdraft
126	Can add rascunho de avaliação	36	add_specialistevaluationdraft
127	Can change rascunho de avaliação	36	change_specialistevaluationdraft
128	Can delete rascunho de avaliação	36	delete_specialistevaluationdraft
129	Can add Evidência	37	add_evidence
130	Can change Evidência	37	change_evidence
131	Can delete Evidência	37	delete_evidence
132	Can add Etapa	38	add_step
133	Can change Etapa	38	change_step
134	Can delete Etapa	38	delete_step
135	Can add Tipo de receita	39	add_revenuetype
136	Can change Tipo de receita	39	change_revenuetype
137	Can delete Tipo de receita	39	delete_revenuetype
138	Can add Custo	40	add_cost
139	Can change Custo	40	change_cost
140	Can delete Custo	40	delete_cost
141	Can add Valor	41	add_value
142	Can change Valor	41	change_value
143	Can delete Valor	41	delete_value
144	Can add Tipo de custo	42	add_costtype
145	Can change Tipo de custo	42	change_costtype
146	Can delete Tipo de custo	42	delete_costtype
147	Can add Custo	43	add_revenue
148	Can change Custo	43	change_revenue
149	Can delete Custo	43	delete_revenue
150	Can add FAQ	44	add_faq
151	Can change FAQ	44	change_faq
152	Can delete FAQ	44	delete_faq
153	Can add País	45	add_country
154	Can change País	45	change_country
155	Can delete País	45	delete_country
156	Can add Estado	46	add_state
157	Can change Estado	46	change_state
158	Can delete Estado	46	delete_state
159	Can add Cidade	47	add_city
160	Can change Cidade	47	change_city
161	Can delete Cidade	47	delete_city
162	Can add company	48	add_company
163	Can change company	48	change_company
164	Can delete company	48	delete_company
165	Can add marketing	48	add_marketing
166	Can change arketing	48	change_marketing
167	Can delete marketing	48	delete_marketing
168	Can add Empresa piloto	49	add_pilotcompany
169	Can change Empresa piloto	49	change_pilotcompany
170	Can delete Empresa piloto	49	delete_pilotcompany
171	Can add pilot results	50	add_pilotresults
172	Can change pilot results	50	change_pilotresults
173	Can delete pilot results	50	delete_pilotresults
174	Can add pilot company contact	51	add_pilotcompanycontact
175	Can change pilot company contact	51	change_pilotcompanycontact
176	Can delete pilot company contact	51	delete_pilotcompanycontact
177	Can add unlisted reference file	52	add_unlistedreferencefile
178	Can change unlisted reference file	52	change_unlistedreferencefile
179	Can delete unlisted reference file	52	delete_unlistedreferencefile
180	Can add technology transfer	53	add_technologytransfer
181	Can change technology transfer	53	change_technologytransfer
182	Can delete technology transfer	53	delete_technologytransfer
183	Can add Perfil	54	add_profile
184	Can change Perfil	54	change_profile
185	Can delete Perfil	54	delete_profile
186	Can add received message	55	add_receivedmessage
187	Can change received message	55	change_receivedmessage
188	Can delete received message	55	delete_receivedmessage
189	Can add Tipo de referência	56	add_type
190	Can change Tipo de referência	56	change_type
191	Can delete Tipo de referência	56	delete_type
192	Can add Referência	57	add_reference
193	Can change Referência	57	change_reference
194	Can delete Referência	57	delete_reference
195	Can add Tipo de resultado	58	add_resulttype
196	Can change Tipo de resultado	58	change_resulttype
197	Can delete Tipo de resultado	58	delete_resulttype
198	Can add Resultado esperado	59	add_result
199	Can change Resultado esperado	59	change_result
200	Can delete Resultado esperado	59	delete_result
201	Can add session	60	add_session
202	Can change session	60	change_session
203	Can delete session	60	delete_session
204	Can add Solicitação de Contato	61	add_contactrequest
205	Can change Solicitação de Contato	61	change_contactrequest
206	Can delete Solicitação de Contato	61	delete_contactrequest
207	Pode aprovar solução	8	approve_solution
208	Pode rejeitar solução	8	reject_solution
209	Pode enviar solução para o DN	8	send_solution
210	Can add Grupos	62	add_groupextend
211	Can change Grupos	62	change_groupextend
212	Can delete Grupos	62	delete_groupextend
213	Can add Depoimento	63	add_testimonial
214	Can change Depoimento	63	change_testimonial
215	Can delete Depoimento	63	delete_testimonial
216	Can add resposta	64	add_answer
217	Can change resposta	64	change_answer
218	Can delete resposta	64	delete_answer
219	Can add pergunta	65	add_question
220	Can change pergunta	65	change_question
221	Can delete pergunta	65	delete_question
222	Can add pesquisa de satisfação	66	add_survey
223	Can change pesquisa de satisfação	66	change_survey
224	Can delete pesquisa de satisfação	66	delete_survey
225	Can add resposta do especialista	67	add_useranswer
226	Can change resposta do especialista	67	change_useranswer
227	Can delete resposta do especialista	67	delete_useranswer
\.


--
-- Data for Name: buying_companies_company; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY buying_companies_company (id, company_name, trading_name, cnpj, email, initial_date, final_date, phone, name, cargo, phone_2, name_2, cargo_2, segment_id, size_id, solution_id, state_id, user_id) FROM stdin;
\.


--
-- Data for Name: buying_companies_regional; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY buying_companies_regional (id, date_added, solution_id, state_id, user_id) FROM stdin;
\.


--
-- Data for Name: communication_strategy_competitor; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_competitor (id, name, customizable, company_name, notes, date_added, city_id, income_id, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: communication_strategy_competitor_market; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_competitor_market (id, competitor_id, state_id) FROM stdin;
\.


--
-- Data for Name: communication_strategy_competitorincome; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_competitorincome (id, name, slug, "order") FROM stdin;
\.


--
-- Data for Name: communication_strategy_file; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_file (id, file, notes, date_added, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: communication_strategy_resource; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_resource (id, notes, date_added, solution_id, type_id, user_id) FROM stdin;
\.


--
-- Data for Name: communication_strategy_resourcetype; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_resourcetype (id, name, slug) FROM stdin;
\.


--
-- Data for Name: communication_strategy_strategy; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY communication_strategy_strategy (id, text, video, notes, solution_id, user_id, competitors, video_embed) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	adjustments	adjustments
2	admin	logentry
3	auth	group
4	auth	permission
5	contenttypes	contenttype
6	solutions	category
7	solutions	segment
8	solutions	solution
9	solutions	size
10	solutions	region
11	solutions	solutionstatus
12	solutions	action
13	solutions	status
14	users	user
15	users	historicaluser
16	audience	agerange
17	audience	level
18	audience	region
19	audience	type
20	audience	entity
21	audience	genre
22	buying_companies	regional
23	buying_companies	company
24	communication_strategy	competitor
25	communication_strategy	resource
26	communication_strategy	strategy
27	communication_strategy	resourcetype
28	communication_strategy	file
29	communication_strategy	competitorincome
30	evaluations	evaluation
31	evaluations	specialistevaluation
32	evaluations	resultevaluation
33	evaluations	invites
34	evaluations	stepevaluation
35	evaluations_drafts	evaluationdraft
36	evaluations_drafts	specialistevaluationdraft
37	evidences	evidence
38	execution_plan	step
39	expenses_and_revenues	revenuetype
40	expenses_and_revenues	cost
41	expenses_and_revenues	value
42	expenses_and_revenues	costtype
43	expenses_and_revenues	revenue
44	faq	faq
45	geodata	country
46	geodata	state
47	geodata	city
48	marketing	company
49	marketing	pilotcompany
50	marketing	pilotresults
51	marketing	pilotcompanycontact
52	marketing	unlistedreferencefile
53	marketing	technologytransfer
54	profiles	profile
55	received_messages	receivedmessage
56	references	type
57	references	reference
58	results	resulttype
59	results	result
60	sessions	session
61	solutions	contactrequest
62	users	groupextend
63	testimonials	testimonial
64	surveys	answer
65	surveys	question
66	surveys	survey
67	surveys	useranswer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-18 02:50:40.176764+00
2	contenttypes	0002_remove_content_type_name	2017-11-18 02:50:40.196102+00
3	auth	0001_initial	2017-11-18 02:50:40.313913+00
4	auth	0002_alter_permission_name_max_length	2017-11-18 02:50:40.324735+00
5	auth	0003_alter_user_email_max_length	2017-11-18 02:50:40.337618+00
6	auth	0004_alter_user_username_opts	2017-11-18 02:50:40.351964+00
7	auth	0005_alter_user_last_login_null	2017-11-18 02:50:40.36424+00
8	auth	0006_require_contenttypes_0002	2017-11-18 02:50:40.368766+00
9	auth	0007_alter_validators_add_error_messages	2017-11-18 02:50:40.379955+00
10	auth	0008_alter_user_username_max_length	2017-11-18 02:50:40.390982+00
11	users	0001_initial	2017-11-18 02:50:40.558032+00
12	solutions	0001_initial	2017-11-18 02:50:40.698524+00
13	solutions	0002_auto_20170614_1725	2017-11-18 02:50:40.798727+00
14	solutions	0003_auto_20170627_1733	2017-11-18 02:50:40.852114+00
15	solutions	0004_solution_status	2017-11-18 02:50:40.930363+00
16	solutions	0005_auto_20170718_1530	2017-11-18 02:50:40.952583+00
17	solutions	0006_auto_20170718_1531	2017-11-18 02:50:40.976354+00
18	solutions	0007_auto_20170718_1621	2017-11-18 02:50:40.994888+00
19	solutions	0008_solution_banner	2017-11-18 02:50:41.070332+00
20	solutions	0009_auto_20170912_1904	2017-11-18 02:50:41.092106+00
21	solutions	0010_auto_20170915_1600	2017-11-18 02:50:41.278743+00
22	solutions	0011_auto_20170915_1625	2017-11-18 02:50:41.435771+00
23	solutions	0012_auto_20170928_1447	2017-11-18 02:50:41.593043+00
24	solutions	0013_solution_extra_expenses	2017-11-18 02:50:41.615108+00
25	solutions	0014_solution_can_reach_others	2017-11-18 02:50:41.642511+00
26	solutions	0015_solution_can_create_new_services	2017-11-18 02:50:41.664014+00
27	solutions	0016_companies	2017-11-18 02:50:41.719739+00
28	solutions	0017_auto_20171010_1628	2017-11-18 02:50:41.769466+00
29	solutions	0018_auto_20171010_1630	2017-11-18 02:50:41.827102+00
30	solutions	0019_solution_desc_methodology	2017-11-18 02:50:41.848936+00
31	solutions	0020_solution_template	2017-11-18 02:50:41.922108+00
32	solutions	0021_auto_20171019_1833	2017-11-18 02:50:42.226679+00
33	solutions	0022_region	2017-11-18 02:50:42.258687+00
34	solutions	0023_auto_20171026_1740	2017-11-18 02:50:42.282933+00
35	solutions	0024_auto_20171030_1457	2017-11-18 02:50:42.403323+00
36	solutions	0025_auto_20171030_1505	2017-11-18 02:50:42.480794+00
37	solutions	0024_auto_20171027_0926	2017-11-18 02:50:42.498222+00
38	solutions	0026_merge_20171030_1531	2017-11-18 02:50:42.502559+00
39	solutions	0027_category_icon_class	2017-11-18 02:50:42.515004+00
40	solutions	0028_auto_20171101_1216	2017-11-18 02:50:42.53175+00
41	solutions	0029_auto_20171106_1606	2017-11-18 02:50:42.551273+00
42	solutions	0030_auto_20171106_1628	2017-11-18 02:50:42.572666+00
43	solutions	0031_auto_20171106_1932	2017-11-18 02:50:42.577936+00
44	solutions	0032_auto_20171106_1933	2017-11-18 02:50:42.613286+00
45	solutions	0033_auto_20171107_1114	2017-11-18 02:50:42.694489+00
46	solutions	0034_auto_20171107_1121	2017-11-18 02:50:42.827437+00
47	solutions	0035_auto_20171107_1128	2017-11-18 02:50:42.837965+00
48	solutions	0036_auto_20171107_1130	2017-11-18 02:50:42.849201+00
49	solutions	0037_auto_20171107_1142	2017-11-18 02:50:42.878616+00
50	solutions	0038_auto_20171107_1147	2017-11-18 02:50:42.919041+00
51	solutions	0031_auto_20171106_1811	2017-11-18 02:50:42.949547+00
52	solutions	0039_merge_20171107_1511	2017-11-18 02:50:42.956677+00
53	solutions	0040_status_allow_update	2017-11-18 02:50:43.025217+00
54	solutions	0039_merge_20171107_1251	2017-11-18 02:50:43.030192+00
55	solutions	0041_merge_20171108_1006	2017-11-18 02:50:43.034834+00
56	solutions	0042_action	2017-11-18 02:50:43.106932+00
57	solutions	0043_auto_20171108_1443	2017-11-18 02:50:43.120555+00
58	solutions	0044_action_order	2017-11-18 02:50:43.203059+00
59	solutions	0045_auto_20171108_1452	2017-11-18 02:50:43.2156+00
60	solutions	0046_action_icon_class	2017-11-18 02:50:43.23698+00
61	solutions	0047_auto_20171108_1532	2017-11-18 02:50:43.335949+00
62	solutions	0048_auto_20171108_1535	2017-11-18 02:50:43.349867+00
63	solutions	0049_action_modal_id	2017-11-18 02:50:43.368017+00
64	adjustments	0001_initial	2017-11-18 02:50:43.457612+00
65	adjustments	0002_adjustments_is_shown	2017-11-18 02:50:43.527307+00
66	admin	0001_initial	2017-11-18 02:50:43.649771+00
67	admin	0002_logentry_remove_auto_add	2017-11-18 02:50:43.673016+00
68	solutions	0042_auto_20171108_1431	2017-11-18 02:50:43.699744+00
69	solutions	0050_merge_20171109_1406	2017-11-18 02:50:43.704858+00
70	solutions	0051_auto_20171109_1520	2017-11-18 02:50:43.723879+00
71	solutions	0052_status_show_adjustments	2017-11-18 02:50:43.785893+00
72	solutions	0053_status_next_status	2017-11-18 02:50:43.827504+00
73	solutions	0054_auto_20171109_2214	2017-11-18 02:50:43.881603+00
74	solutions	0055_auto_20171110_2108	2017-11-18 02:50:43.904865+00
75	solutions	0056_solution_active	2017-11-18 02:50:43.996321+00
76	solutions	0057_auto_20171113_0956	2017-11-18 02:50:44.037365+00
77	solutions	0058_auto_20171113_0958	2017-11-18 02:50:44.192668+00
78	solutions	0059_auto_20171113_1311	2017-11-18 02:50:44.439559+00
79	solutions	0060_action_permission	2017-11-18 02:50:44.481755+00
80	solutions	0061_auto_20171114_1149	2017-11-18 02:50:44.508765+00
81	solutions	0062_auto_20171114_1535	2017-11-18 02:50:44.534722+00
82	solutions	0063_action_active	2017-11-18 02:50:44.615846+00
83	solutions	0061_auto_20171114_1531	2017-11-18 02:50:44.67083+00
84	geodata	0001_initial	2017-11-18 02:50:44.812958+00
85	geodata	0002_add_country_states	2017-11-18 02:50:44.851793+00
86	geodata	0003_add_cities	2017-11-18 02:50:45.232872+00
87	geodata	0004_auto_20170706_1046	2017-11-18 02:50:45.25667+00
88	solutions	0062_contactrequest	2017-11-18 02:50:45.338739+00
89	solutions	0064_merge_20171114_1930	2017-11-18 02:50:45.343152+00
90	solutions	0065_solution_next_status	2017-11-18 02:50:45.389594+00
91	solutions	0066_auto_20171114_1935	2017-11-18 02:50:45.482096+00
92	solutions	0063_contactrequest_returned	2017-11-18 02:50:45.583326+00
93	solutions	0064_merge_20171114_1745	2017-11-18 02:50:45.587011+00
94	solutions	0065_auto_20171114_1937	2017-11-18 02:50:45.671123+00
95	solutions	0067_merge_20171114_1946	2017-11-18 02:50:45.675468+00
96	solutions	0068_auto_20171115_1236	2017-11-18 02:50:45.821936+00
97	audience	0001_initial	2017-11-18 02:50:46.353669+00
98	audience	0002_auto_20170704_1833	2017-11-18 02:50:46.488251+00
99	audience	0003_auto_20170705_1117	2017-11-18 02:50:46.552078+00
100	audience	0004_auto_20170705_1134	2017-11-18 02:50:46.594289+00
101	audience	0005_auto_20170705_1532	2017-11-18 02:50:46.655975+00
102	audience	0006_auto_20170919_1538	2017-11-18 02:50:46.798025+00
103	audience	0007_auto_20170920_1415	2017-11-18 02:50:47.135419+00
104	audience	0008_auto_20171005_1507	2017-11-18 02:50:47.185875+00
105	audience	0009_auto_20171115_1236	2017-11-18 02:50:47.426266+00
106	audience	0010_auto_20171116_1215	2017-11-18 02:50:47.516665+00
107	audience	0011_auto_20171116_1227	2017-11-18 02:50:47.533126+00
108	audience	0012_remove_entity_country_name	2017-11-18 02:50:47.572304+00
109	audience	0013_auto_20171117_1541	2017-11-18 02:50:47.686169+00
110	buying_companies	0001_initial	2017-11-18 02:50:47.830095+00
111	buying_companies	0002_auto_20171101_1603	2017-11-18 02:50:48.063966+00
112	buying_companies	0003_auto_20171116_1653	2017-11-18 02:50:48.14607+00
113	buying_companies	0004_auto_20171116_1657	2017-11-18 02:50:48.229403+00
114	communication_strategy	0001_initial	2017-11-18 02:50:48.801669+00
115	communication_strategy	0002_auto_20171010_1024	2017-11-18 02:50:48.911433+00
116	communication_strategy	0003_strategy_competitors	2017-11-18 02:50:49.000792+00
117	communication_strategy	0004_auto_20171115_1236	2017-11-18 02:50:49.139837+00
118	communication_strategy	0005_auto_20171116_1234	2017-11-18 02:50:49.214758+00
119	communication_strategy	0006_strategy_video_embed	2017-11-18 02:50:49.260207+00
120	evaluations_drafts	0001_initial	2017-11-18 02:50:49.350993+00
121	evaluations_drafts	0002_auto_20171018_1449	2017-11-18 02:50:49.736903+00
122	evaluations_drafts	0003_specialistevaluationdraft	2017-11-18 02:50:49.828635+00
123	evaluations_drafts	0004_auto_20171019_1639	2017-11-18 02:50:49.872211+00
124	results	0001_initial	2017-11-18 02:50:50.111724+00
125	results	0002_auto_20170629_1122	2017-11-18 02:50:50.337345+00
126	execution_plan	0001_initial	2017-11-18 02:50:50.503837+00
127	execution_plan	0002_step_solution	2017-11-18 02:50:50.576125+00
128	execution_plan	0003_file_step	2017-11-18 02:50:50.653955+00
129	execution_plan	0004_auto_20170623_1155	2017-11-18 02:50:50.830267+00
130	execution_plan	0005_auto_20170626_1140	2017-11-18 02:50:51.009518+00
131	execution_plan	0006_auto_20170703_1627	2017-11-18 02:50:51.182714+00
132	evaluations	0001_initial	2017-11-18 02:50:51.275346+00
133	evaluations	0002_auto_20170721_1618	2017-11-18 02:50:51.897663+00
134	evaluations	0003_adjustments_invites	2017-11-18 02:50:52.084828+00
135	evaluations	0004_auto_20171019_1216	2017-11-18 02:50:52.412323+00
136	evaluations	0005_auto_20171019_1641	2017-11-18 02:50:52.712736+00
137	evaluations	0006_auto_20171024_1521	2017-11-18 02:50:52.739597+00
138	evaluations	0007_auto_20171024_1617	2017-11-18 02:50:52.772556+00
139	evaluations	0008_auto_20171025_1554	2017-11-18 02:50:53.002473+00
140	evaluations	0009_auto_20171025_1812	2017-11-18 02:50:53.163179+00
141	evaluations	0010_auto_20171026_1819	2017-11-18 02:50:53.348097+00
142	evaluations	0011_auto_20171027_1122	2017-11-18 02:50:53.403331+00
143	evaluations	0012_auto_20171027_1449	2017-11-18 02:50:53.455378+00
144	evaluations	0013_auto_20171031_1628	2017-11-18 02:50:53.515475+00
145	evaluations	0010_auto_20171030_1751	2017-11-18 02:50:53.610147+00
146	evaluations	0014_merge_20171103_0901	2017-11-18 02:50:53.615451+00
147	evaluations	0014_merge_20171101_1359	2017-11-18 02:50:53.62006+00
148	evaluations	0015_merge_20171103_1139	2017-11-18 02:50:53.624445+00
149	evaluations	0015_merge_20171103_1040	2017-11-18 02:50:53.631219+00
150	evaluations	0016_merge_20171106_1449	2017-11-18 02:50:53.637168+00
151	evaluations	0017_auto_20171109_1219	2017-11-18 02:50:53.642847+00
152	evaluations	0016_auto_20171109_2158	2017-11-18 02:50:53.651451+00
153	evaluations	0018_merge_20171110_1454	2017-11-18 02:50:53.65756+00
154	evaluations	0019_auto_20171110_2108	2017-11-18 02:50:53.66556+00
155	evaluations	0020_auto_20171112_2322	2017-11-18 02:50:53.673687+00
156	evaluations	0021_auto_20171113_1046	2017-11-18 02:50:53.681167+00
157	evaluations	0022_auto_20171113_1211	2017-11-18 02:50:53.692615+00
158	evaluations	0023_auto_20171113_1304	2017-11-18 02:50:53.701494+00
159	evaluations	0024_auto_20171114_0809	2017-11-18 02:50:53.708505+00
160	evaluations	0025_auto_20171114_1535	2017-11-18 02:50:53.890966+00
161	evidences	0001_initial	2017-11-18 02:50:54.020139+00
162	evidences	0002_auto_20171006_1140	2017-11-18 02:50:54.235058+00
163	execution_plan	0007_step_duration	2017-11-18 02:50:54.352063+00
164	execution_plan	0008_auto_20170918_1120	2017-11-18 02:50:54.503767+00
165	execution_plan	0009_step_planning_duration	2017-11-18 02:50:54.619437+00
166	expenses_and_revenues	0001_initial	2017-11-18 02:50:55.23624+00
167	expenses_and_revenues	0002_auto_20170922_1622	2017-11-18 02:50:55.685551+00
168	expenses_and_revenues	0003_auto_20170922_1633	2017-11-18 02:50:55.96595+00
169	expenses_and_revenues	0004_remove_cost_extra_expenses	2017-11-18 02:50:56.029638+00
170	expenses_and_revenues	0005_auto_20171115_1306	2017-11-18 02:50:56.048159+00
171	expenses_and_revenues	0006_auto_20171115_1315	2017-11-18 02:50:56.070331+00
172	expenses_and_revenues	0007_auto_20171115_1320	2017-11-18 02:50:56.187644+00
173	faq	0001_initial	2017-11-18 02:50:56.220573+00
174	faq	0002_auto_20171116_1147	2017-11-18 02:50:56.242054+00
175	marketing	0001_initial	2017-11-18 02:50:57.356957+00
176	marketing	0002_auto_20171017_1543	2017-11-18 02:50:57.790056+00
177	marketing	0003_delete_training	2017-11-18 02:50:57.812252+00
178	marketing	0004_remove_unlistedreferencefile_documentation	2017-11-18 02:50:57.87452+00
179	marketing	0005_auto_20171019_1833	2017-11-18 02:50:58.09476+00
180	marketing	0006_auto_20171116_1939	2017-11-18 02:50:58.155283+00
181	profiles	0001_initial	2017-11-18 02:50:58.277501+00
182	profiles	0002_auto_20171107_1036	2017-11-18 02:50:58.372936+00
183	received_messages	0001_initial	2017-11-18 02:50:58.484602+00
184	references	0001_initial	2017-11-18 02:50:58.8656+00
185	references	0002_auto_20171002_1646	2017-11-18 02:50:58.963622+00
186	results	0003_auto_20170725_1508	2017-11-18 02:50:59.274778+00
187	results	0004_auto_20170725_1509	2017-11-18 02:50:59.379118+00
188	results	0005_auto_20170725_1509	2017-11-18 02:50:59.476364+00
189	results	0006_result_step	2017-11-18 02:50:59.576381+00
190	results	0007_auto_20171116_1440	2017-11-18 02:50:59.592405+00
191	results	0008_auto_20171117_1602	2017-11-18 02:50:59.792037+00
192	sessions	0001_initial	2017-11-18 02:50:59.828391+00
193	users	0002_auto_20170719_1449	2017-11-18 02:51:00.240212+00
194	users	0003_auto_20170721_1309	2017-11-18 02:51:00.353511+00
195	users	0004_profile	2017-11-18 02:51:00.493586+00
196	users	0005_groupextend	2017-11-18 02:51:00.601336+00
197	users	0006_auto_20171025_1348	2017-11-18 02:51:00.624701+00
198	users	0007_auto_20171026_1811	2017-11-18 02:51:00.715613+00
199	users	0008_groupextend_ranking	2017-11-18 02:51:00.743503+00
200	users	0009_auto_20171106_1910	2017-11-18 02:51:01.295764+00
201	users	0010_auto_20171113_1100	2017-11-18 02:51:01.78224+00
202	solutions	0069_auto_20171115_1448	2017-11-18 02:51:02.000104+00
203	solutions	0070_auto_20171115_1449	2017-11-18 02:51:02.050946+00
204	solutions	0071_auto_20171115_1533	2017-11-18 02:51:02.443836+00
205	solutions	0072_auto_20171115_1544	2017-11-18 02:51:02.519978+00
206	solutions	0073_auto_20171116_1555	2017-11-18 02:51:02.587225+00
207	surveys	0001_initial	2017-11-18 02:51:02.972569+00
208	surveys	0002_auto_20171025_1841	2017-11-18 02:51:03.099242+00
209	surveys	0003_auto_20171025_2000	2017-11-18 02:51:03.1369+00
210	testimonials	0001_initial	2017-11-18 02:51:03.249107+00
211	testimonials	0002_auto_20170714_1551	2017-11-18 02:51:03.316713+00
212	testimonials	0003_auto_20170922_1752	2017-11-18 02:51:03.476049+00
213	testimonials	0004_testimonial_video_embed	2017-11-18 02:51:03.545017+00
214	users	0011_auto_20171116_1903	2017-11-18 02:51:03.662197+00
215	users	0012_auto_20171116_2032	2017-11-18 02:51:03.8622+00
216	users	0013_auto_20171116_2036	2017-11-18 02:51:04.00034+00
217	users	0014_auto_20171117_1142	2017-11-18 02:51:04.14458+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: evaluations_drafts_evaluationdraft; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_drafts_evaluationdraft (date, id, documentation, documentation_notes, newasset, newasset_notes, scalability, scalability_notes, potential, potential_notes, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: evaluations_drafts_specialistevaluationdraft; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_drafts_specialistevaluationdraft (id, competitors, competitors_notes, competitors_notes_2, competitors_notes_3, competitors_notes_4, judgment, judgment_notes, date, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: evaluations_evaluation; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_evaluation (date, id, documentation, documentation_notes, newasset, newasset_notes, scalability, scalability_notes, potential, potential_notes, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: evaluations_invites; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_invites (date, id, accepted, solution_id, user_id, date_answered) FROM stdin;
\.


--
-- Data for Name: evaluations_resultevaluation; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_resultevaluation (date, id, done, notes, result_id, specialist_evaluation_id, specialist_evaluation_draft_id, user_id) FROM stdin;
\.


--
-- Data for Name: evaluations_specialistevaluation; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_specialistevaluation (date, id, competitors, competitors_notes, competitors_notes_2, competitors_notes_3, competitors_notes_4, judgment, judgment_notes, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: evaluations_stepevaluation; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evaluations_stepevaluation (date, id, done, notes, specialist_evaluation_id, step_id, specialist_evaluation_draft_id, user_id) FROM stdin;
\.


--
-- Data for Name: evidences_evidence; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY evidences_evidence (id, file, notes, date_added, object_id, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: execution_plan_step; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY execution_plan_step (id, name, slug, description, "order", user_id, solution_id, duration, planning_duration) FROM stdin;
\.


--
-- Data for Name: expenses_and_revenues_cost; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY expenses_and_revenues_cost (id, value, notes, solution_id, type_id, user_id) FROM stdin;
\.


--
-- Data for Name: expenses_and_revenues_costtype; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY expenses_and_revenues_costtype (id, name, slug) FROM stdin;
1	Recursos humanos	recursos-humanos
2	Ativos tecnológicos	ativos-tecnologicos
3	Sistemas	sistemas
4	Conhecimentos/metodologia	conhecimentosmetodologia
\.


--
-- Data for Name: expenses_and_revenues_revenue; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY expenses_and_revenues_revenue (id, value, notes, solution_id, type_id, user_id, bid_details, negotiation_details) FROM stdin;
\.


--
-- Data for Name: expenses_and_revenues_revenuetype; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY expenses_and_revenues_revenuetype (id, name, slug) FROM stdin;
1	Faturamento contínuo fixo por meio de contrato	faturamento-continuo-fixo-por-meio-de-contrato
2	Faturamento escalonado por meio de entregas pré acordadas no projeto	faturamento-escalonado-por-meio-de-entregas-pre-acordadas-no-projeto
3	Faturamento por atendimento sob demanda	faturamento-por-atendimento-sob-demanda
4	Faturamento por meio de convênios/parcerias	faturamento-por-meio-de-conveniosparcerias
5	Outros	outros
\.


--
-- Data for Name: expenses_and_revenues_value; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY expenses_and_revenues_value (id, value, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: faq_faq; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY faq_faq (id, title, answer) FROM stdin;
1	1. Qual o diferencial da Plataforma Nacional de Soluções SESI?	O SESI atua com inovação em Saúde e Segurança para Indústria nas principais temáticas de afastamentos dos trabalhadores, em ergonomia, longevidade, fatores psicossociais, economia para saúde e segurança, prevenção da incapacidade, higiene ocupacional, tecnologias para saúde e sistemas de gestão. Os Centros de Inovação SESI possuem processos de elaboração de projetos e execução customizados. Estabelecem parcerias com outros Centros de Inovação, institutos, universidades, indústria e demais atores na elaboração e execução dos projetos, e assim aplicam as soluções com foco nos resultados esperados.
2	2. Devo me registrar para utilizar esta plataforma?	Não. Você pode acessar a plataforma e conhecer as soluções inovadoras em saúde e segurança. Para maiores informações entre em contato conosco através do site ou do email inovacaosesi@cni.org.br.
3	3. Como posso fazer uma solicitação de atendimento?	"Você pode acessar pelo botão da home ou no Menu 'APOIO SESI' no canto superior esquerdo do site" e Add URL direta.
4	4. Como conhecer os detalhes e resultados das soluções?	Cada solução é composta por fases, etapas, metodologia, tecnologias e modelos próprios de execução, conforme desafio. Clicar no botão "Saiba Mais" da Solução que deseja ter mais detalhes.
5	5. Como posso receber uma proposta de atendimento frente os meus desafios?	As equipes dos Centros de Inovação são especializadas em saúde e segurança na indústria para compreender sua demanda e gerar proposta de atendimento. Solicite proposta pelo link <a href="/apoio-sesi">“tenho um desafio”</a>.
\.


--
-- Data for Name: geodata_city; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY geodata_city (id, name, code, state_id) FROM stdin;
1	Acrelândia	1200013	1
2	Assis Brasil	1200054	1
3	Brasiléia	1200104	1
4	Bujari	1200138	1
5	Capixaba	1200179	1
6	Cruzeiro do Sul	1200203	1
7	Epitaciolândia	1200252	1
8	Feijó	1200302	1
9	Jordão	1200328	1
10	Mâncio Lima	1200336	1
11	Manoel Urbano	1200344	1
12	Marechal Thaumaturgo	1200351	1
13	Plácido de Castro	1200385	1
14	Porto Acre	1200807	1
15	Porto Walter	1200393	1
16	Rio Branco	1200401	1
17	Rodrigues Alves	1200427	1
18	Santa Rosa do Purus	1200435	1
19	Sena Madureira	1200500	1
20	Senador Guiomard	1200450	1
21	Tarauacá	1200609	1
22	Xapuri	1200708	1
23	Água Branca	2700102	2
24	Anadia	2700201	2
25	Arapiraca	2700300	2
26	Atalaia	2700409	2
27	Barra de Santo Antônio	2700508	2
28	Barra de São Miguel	2700607	2
29	Batalha	2700706	2
30	Belém	2700805	2
31	Belo Monte	2700904	2
32	Boca da Mata	2701001	2
33	Branquinha	2701100	2
34	Cacimbinhas	2701209	2
35	Cajueiro	2701308	2
36	Campestre	2701357	2
37	Campo Alegre	2701407	2
38	Campo Grande	2701506	2
39	Canapi	2701605	2
40	Capela	2701704	2
41	Carneiros	2701803	2
42	Chã Preta	2701902	2
43	Coité do Nóia	2702009	2
44	Colônia Leopoldina	2702108	2
45	Coqueiro Seco	2702207	2
46	Coruripe	2702306	2
47	Craíbas	2702355	2
48	Delmiro Gouveia	2702405	2
49	Dois Riachos	2702504	2
50	Estrela de Alagoas	2702553	2
51	Feira Grande	2702603	2
52	Feliz Deserto	2702702	2
53	Flexeiras	2702801	2
54	Girau do Ponciano	2702900	2
55	Ibateguara	2703007	2
56	Igaci	2703106	2
57	Igreja Nova	2703205	2
58	Inhapi	2703304	2
59	Jacaré dos Homens	2703403	2
60	Jacuípe	2703502	2
61	Japaratinga	2703601	2
62	Jaramataia	2703700	2
63	Jequiá da Praia	2703759	2
64	Joaquim Gomes	2703809	2
65	Jundiá	2703908	2
66	Junqueiro	2704005	2
67	Lagoa da Canoa	2704104	2
68	Limoeiro de Anadia	2704203	2
69	Maceió	2704302	2
70	Major Isidoro	2704401	2
71	Mar Vermelho	2704906	2
72	Maragogi	2704500	2
73	Maravilha	2704609	2
74	Marechal Deodoro	2704708	2
75	Maribondo	2704807	2
76	Mata Grande	2705002	2
77	Matriz de Camaragibe	2705101	2
78	Messias	2705200	2
79	Minador do Negrão	2705309	2
80	Monteirópolis	2705408	2
81	Murici	2705507	2
82	Novo Lino	2705606	2
83	Olho d'Água das Flores	2705705	2
84	Olho d'Água do Casado	2705804	2
85	Olho d'Água Grande	2705903	2
86	Olivença	2706000	2
87	Ouro Branco	2706109	2
88	Palestina	2706208	2
89	Palmeira dos Índios	2706307	2
90	Pão de Açúcar	2706406	2
91	Pariconha	2706422	2
92	Paripueira	2706448	2
93	Passo de Camaragibe	2706505	2
94	Paulo Jacinto	2706604	2
95	Penedo	2706703	2
96	Piaçabuçu	2706802	2
97	Pilar	2706901	2
98	Pindoba	2707008	2
99	Piranhas	2707107	2
100	Poço das Trincheiras	2707206	2
101	Porto Calvo	2707305	2
102	Porto de Pedras	2707404	2
103	Porto Real do Colégio	2707503	2
104	Quebrangulo	2707602	2
105	Rio Largo	2707701	2
106	Roteiro	2707800	2
107	Santa Luzia do Norte	2707909	2
108	Santana do Ipanema	2708006	2
109	Santana do Mundaú	2708105	2
110	São Brás	2708204	2
111	São José da Laje	2708303	2
112	São José da Tapera	2708402	2
113	São Luís do Quitunde	2708501	2
114	São Miguel dos Campos	2708600	2
115	São Miguel dos Milagres	2708709	2
116	São Sebastião	2708808	2
117	Satuba	2708907	2
118	Senador Rui Palmeira	2708956	2
119	Tanque d'Arca	2709004	2
120	Taquarana	2709103	2
121	Teotônio Vilela	2709152	2
122	Traipu	2709202	2
123	União dos Palmares	2709301	2
124	Viçosa	2709400	2
125	Alvarães	1300029	3
126	Amaturá	1300060	3
127	Anamã	1300086	3
128	Anori	1300102	3
129	Apuí	1300144	3
130	Atalaia do Norte	1300201	3
131	Autazes	1300300	3
132	Barcelos	1300409	3
133	Barreirinha	1300508	3
134	Benjamin Constant	1300607	3
135	Beruri	1300631	3
136	Boa Vista do Ramos	1300680	3
137	Boca do Acre	1300706	3
138	Borba	1300805	3
139	Caapiranga	1300839	3
140	Canutama	1300904	3
141	Carauari	1301001	3
142	Careiro	1301100	3
143	Careiro da Várzea	1301159	3
144	Coari	1301209	3
145	Codajás	1301308	3
146	Eirunepé	1301407	3
147	Envira	1301506	3
148	Fonte Boa	1301605	3
149	Guajará	1301654	3
150	Humaitá	1301704	3
151	Ipixuna	1301803	3
152	Iranduba	1301852	3
153	Itacoatiara	1301902	3
154	Itamarati	1301951	3
155	Itapiranga	1302009	3
156	Japurá	1302108	3
157	Juruá	1302207	3
158	Jutaí	1302306	3
159	Lábrea	1302405	3
160	Manacapuru	1302504	3
161	Manaquiri	1302553	3
162	Manaus	1302603	3
163	Manicoré	1302702	3
164	Maraã	1302801	3
165	Maués	1302900	3
166	Nhamundá	1303007	3
167	Nova Olinda do Norte	1303106	3
168	Novo Airão	1303205	3
169	Novo Aripuanã	1303304	3
170	Parintins	1303403	3
171	Pauini	1303502	3
172	Presidente Figueiredo	1303536	3
173	Rio Preto da Eva	1303569	3
174	Santa Isabel do Rio Negro	1303601	3
175	Santo Antônio do Içá	1303700	3
176	São Gabriel da Cachoeira	1303809	3
177	São Paulo de Olivença	1303908	3
178	São Sebastião do Uatumã	1303957	3
179	Silves	1304005	3
180	Tabatinga	1304062	3
181	Tapauá	1304104	3
182	Tefé	1304203	3
183	Tonantins	1304237	3
184	Uarini	1304260	3
185	Urucará	1304302	3
186	Urucurituba	1304401	3
187	Amapá	1600105	4
188	Calçoene	1600204	4
189	Cutias	1600212	4
190	Ferreira Gomes	1600238	4
191	Itaubal	1600253	4
192	Laranjal do Jari	1600279	4
193	Macapá	1600303	4
194	Mazagão	1600402	4
195	Oiapoque	1600501	4
196	Pedra Branca do Amaparí	1600154	4
197	Porto Grande	1600535	4
198	Pracuúba	1600550	4
199	Santana	1600600	4
200	Serra do Navio	1600055	4
201	Tartarugalzinho	1600709	4
202	Vitória do Jari	1600808	4
203	Abaíra	2900108	5
204	Abaré	2900207	5
205	Acajutiba	2900306	5
206	Adustina	2900355	5
207	Água Fria	2900405	5
208	Aiquara	2900603	5
209	Alagoinhas	2900702	5
210	Alcobaça	2900801	5
211	Almadina	2900900	5
212	Amargosa	2901007	5
213	Amélia Rodrigues	2901106	5
214	América Dourada	2901155	5
215	Anagé	2901205	5
216	Andaraí	2901304	5
217	Andorinha	2901353	5
218	Angical	2901403	5
219	Anguera	2901502	5
220	Antas	2901601	5
221	Antônio Cardoso	2901700	5
222	Antônio Gonçalves	2901809	5
223	Aporá	2901908	5
224	Apuarema	2901957	5
225	Araças	2902054	5
226	Aracatu	2902005	5
227	Araci	2902104	5
228	Aramari	2902203	5
229	Arataca	2902252	5
230	Aratuípe	2902302	5
231	Aurelino Leal	2902401	5
232	Baianópolis	2902500	5
233	Baixa Grande	2902609	5
234	Banzaê	2902658	5
235	Barra	2902708	5
236	Barra da Estiva	2902807	5
237	Barra do Choça	2902906	5
238	Barra do Mendes	2903003	5
239	Barra do Rocha	2903102	5
240	Barreiras	2903201	5
241	Barro Alto	2903235	5
242	Barro Preto	2903300	5
243	Barrocas	2903276	5
244	Belmonte	2903409	5
245	Belo Campo	2903508	5
246	Biritinga	2903607	5
247	Boa Nova	2903706	5
248	Boa Vista do Tupim	2903805	5
249	Bom Jesus da Lapa	2903904	5
250	Bom Jesus da Serra	2903953	5
251	Boninal	2904001	5
252	Bonito	2904050	5
253	Boquira	2904100	5
254	Botuporã	2904209	5
255	Brejões	2904308	5
256	Brejolândia	2904407	5
257	Brotas de Macaúbas	2904506	5
258	Brumado	2904605	5
259	Buerarema	2904704	5
260	Buritirama	2904753	5
261	Caatiba	2904803	5
262	Cabaceiras do Paraguaçu	2904852	5
263	Cachoeira	2904902	5
264	Caculé	2905008	5
265	Caém	2905107	5
266	Caetanos	2905156	5
267	Caetité	2905206	5
268	Cafarnaum	2905305	5
269	Cairu	2905404	5
270	Caldeirão Grande	2905503	5
271	Camacan	2905602	5
272	Camaçari	2905701	5
273	Camamu	2905800	5
274	Campo Alegre de Lourdes	2905909	5
275	Campo Formoso	2906006	5
276	Canápolis	2906105	5
277	Canarana	2906204	5
278	Canavieiras	2906303	5
279	Candeal	2906402	5
280	Candeias	2906501	5
281	Candiba	2906600	5
282	Cândido Sales	2906709	5
283	Cansanção	2906808	5
284	Canudos	2906824	5
285	Capela do Alto Alegre	2906857	5
286	Capim Grosso	2906873	5
287	Caraíbas	2906899	5
288	Caravelas	2906907	5
289	Cardeal da Silva	2907004	5
290	Carinhanha	2907103	5
291	Casa Nova	2907202	5
292	Castro Alves	2907301	5
293	Catolândia	2907400	5
294	Catu	2907509	5
295	Caturama	2907558	5
296	Central	2907608	5
297	Chorrochó	2907707	5
298	Cícero Dantas	2907806	5
299	Cipó	2907905	5
300	Coaraci	2908002	5
301	Cocos	2908101	5
302	Conceição da Feira	2908200	5
303	Conceição do Almeida	2908309	5
304	Conceição do Coité	2908408	5
305	Conceição do Jacuípe	2908507	5
306	Conde	2908606	5
307	Condeúba	2908705	5
308	Contendas do Sincorá	2908804	5
309	Coração de Maria	2908903	5
310	Cordeiros	2909000	5
311	Coribe	2909109	5
312	Coronel João Sá	2909208	5
313	Correntina	2909307	5
314	Cotegipe	2909406	5
315	Cravolândia	2909505	5
316	Crisópolis	2909604	5
317	Cristópolis	2909703	5
318	Cruz das Almas	2909802	5
319	Curaçá	2909901	5
320	Dário Meira	2910008	5
321	Dias d'Ávila	2910057	5
322	Dom Basílio	2910107	5
323	Dom Macedo Costa	2910206	5
324	Elísio Medrado	2910305	5
325	Encruzilhada	2910404	5
326	Entre Rios	2910503	5
327	Érico Cardoso	2900504	5
328	Esplanada	2910602	5
329	Euclides da Cunha	2910701	5
330	Eunápolis	2910727	5
331	Fátima	2910750	5
332	Feira da Mata	2910776	5
333	Feira de Santana	2910800	5
334	Filadélfia	2910859	5
335	Firmino Alves	2910909	5
336	Floresta Azul	2911006	5
337	Formosa do Rio Preto	2911105	5
338	Gandu	2911204	5
339	Gavião	2911253	5
340	Gentio do Ouro	2911303	5
341	Glória	2911402	5
342	Gongogi	2911501	5
343	Governador Mangabeira	2911600	5
344	Guajeru	2911659	5
345	Guanambi	2911709	5
346	Guaratinga	2911808	5
347	Heliópolis	2911857	5
348	Iaçu	2911907	5
349	Ibiassucê	2912004	5
350	Ibicaraí	2912103	5
351	Ibicoara	2912202	5
352	Ibicuí	2912301	5
353	Ibipeba	2912400	5
354	Ibipitanga	2912509	5
355	Ibiquera	2912608	5
356	Ibirapitanga	2912707	5
357	Ibirapuã	2912806	5
358	Ibirataia	2912905	5
359	Ibitiara	2913002	5
360	Ibititá	2913101	5
361	Ibotirama	2913200	5
362	Ichu	2913309	5
363	Igaporã	2913408	5
364	Igrapiúna	2913457	5
365	Iguaí	2913507	5
366	Ilhéus	2913606	5
367	Inhambupe	2913705	5
368	Ipecaetá	2913804	5
369	Ipiaú	2913903	5
370	Ipirá	2914000	5
371	Ipupiara	2914109	5
372	Irajuba	2914208	5
373	Iramaia	2914307	5
374	Iraquara	2914406	5
375	Irará	2914505	5
376	Irecê	2914604	5
377	Itabela	2914653	5
378	Itaberaba	2914703	5
379	Itabuna	2914802	5
380	Itacaré	2914901	5
381	Itaeté	2915007	5
382	Itagi	2915106	5
383	Itagibá	2915205	5
384	Itagimirim	2915304	5
385	Itaguaçu da Bahia	2915353	5
386	Itaju do Colônia	2915403	5
387	Itajuípe	2915502	5
388	Itamaraju	2915601	5
389	Itamari	2915700	5
390	Itambé	2915809	5
391	Itanagra	2915908	5
392	Itanhém	2916005	5
393	Itaparica	2916104	5
394	Itapé	2916203	5
395	Itapebi	2916302	5
396	Itapetinga	2916401	5
397	Itapicuru	2916500	5
398	Itapitanga	2916609	5
399	Itaquara	2916708	5
400	Itarantim	2916807	5
401	Itatim	2916856	5
402	Itiruçu	2916906	5
403	Itiúba	2917003	5
404	Itororó	2917102	5
405	Ituaçu	2917201	5
406	Ituberá	2917300	5
407	Iuiú	2917334	5
408	Jaborandi	2917359	5
409	Jacaraci	2917409	5
410	Jacobina	2917508	5
411	Jaguaquara	2917607	5
412	Jaguarari	2917706	5
413	Jaguaripe	2917805	5
414	Jandaíra	2917904	5
415	Jequié	2918001	5
416	Jeremoabo	2918100	5
417	Jiquiriçá	2918209	5
418	Jitaúna	2918308	5
419	João Dourado	2918357	5
420	Juazeiro	2918407	5
421	Jucuruçu	2918456	5
422	Jussara	2918506	5
423	Jussari	2918555	5
424	Jussiape	2918605	5
425	Lafaiete Coutinho	2918704	5
426	Lagoa Real	2918753	5
427	Laje	2918803	5
428	Lajedão	2918902	5
429	Lajedinho	2919009	5
430	Lajedo do Tabocal	2919058	5
431	Lamarão	2919108	5
432	Lapão	2919157	5
433	Lauro de Freitas	2919207	5
434	Lençóis	2919306	5
435	Licínio de Almeida	2919405	5
436	Livramento de Nossa Senhora	2919504	5
437	Luís Eduardo Magalhães	2919553	5
438	Macajuba	2919603	5
439	Macarani	2919702	5
440	Macaúbas	2919801	5
441	Macururé	2919900	5
442	Madre de Deus	2919926	5
443	Maetinga	2919959	5
444	Maiquinique	2920007	5
445	Mairi	2920106	5
446	Malhada	2920205	5
447	Malhada de Pedras	2920304	5
448	Manoel Vitorino	2920403	5
449	Mansidão	2920452	5
450	Maracás	2920502	5
451	Maragogipe	2920601	5
452	Maraú	2920700	5
453	Marcionílio Souza	2920809	5
454	Mascote	2920908	5
455	Mata de São João	2921005	5
456	Matina	2921054	5
457	Medeiros Neto	2921104	5
458	Miguel Calmon	2921203	5
459	Milagres	2921302	5
460	Mirangaba	2921401	5
461	Mirante	2921450	5
462	Monte Santo	2921500	5
463	Morpará	2921609	5
464	Morro do Chapéu	2921708	5
465	Mortugaba	2921807	5
466	Mucugê	2921906	5
467	Mucuri	2922003	5
468	Mulungu do Morro	2922052	5
469	Mundo Novo	2922102	5
470	Muniz Ferreira	2922201	5
471	Muquém de São Francisco	2922250	5
472	Muritiba	2922300	5
473	Mutuípe	2922409	5
474	Nazaré	2922508	5
475	Nilo Peçanha	2922607	5
476	Nordestina	2922656	5
477	Nova Canaã	2922706	5
478	Nova Fátima	2922730	5
479	Nova Ibiá	2922755	5
480	Nova Itarana	2922805	5
481	Nova Redenção	2922854	5
482	Nova Soure	2922904	5
483	Nova Viçosa	2923001	5
484	Novo Horizonte	2923035	5
485	Novo Triunfo	2923050	5
486	Olindina	2923100	5
487	Oliveira dos Brejinhos	2923209	5
488	Ouriçangas	2923308	5
489	Ourolândia	2923357	5
490	Palmas de Monte Alto	2923407	5
491	Palmeiras	2923506	5
492	Paramirim	2923605	5
493	Paratinga	2923704	5
494	Paripiranga	2923803	5
495	Pau Brasil	2923902	5
496	Paulo Afonso	2924009	5
497	Pé de Serra	2924058	5
498	Pedrão	2924108	5
499	Pedro Alexandre	2924207	5
500	Piatã	2924306	5
501	Pilão Arcado	2924405	5
502	Pindaí	2924504	5
503	Pindobaçu	2924603	5
504	Pintadas	2924652	5
505	Piraí do Norte	2924678	5
506	Piripá	2924702	5
507	Piritiba	2924801	5
508	Planaltino	2924900	5
509	Planalto	2925006	5
510	Poções	2925105	5
511	Pojuca	2925204	5
512	Ponto Novo	2925253	5
513	Porto Seguro	2925303	5
514	Potiraguá	2925402	5
515	Prado	2925501	5
516	Presidente Dutra	2925600	5
517	Presidente Jânio Quadros	2925709	5
518	Presidente Tancredo Neves	2925758	5
519	Queimadas	2925808	5
520	Quijingue	2925907	5
521	Quixabeira	2925931	5
522	Rafael Jambeiro	2925956	5
523	Remanso	2926004	5
524	Retirolândia	2926103	5
525	Riachão das Neves	2926202	5
526	Riachão do Jacuípe	2926301	5
527	Riacho de Santana	2926400	5
528	Ribeira do Amparo	2926509	5
529	Ribeira do Pombal	2926608	5
530	Ribeirão do Largo	2926657	5
531	Rio de Contas	2926707	5
532	Rio do Antônio	2926806	5
533	Rio do Pires	2926905	5
534	Rio Real	2927002	5
535	Rodelas	2927101	5
536	Ruy Barbosa	2927200	5
537	Salinas da Margarida	2927309	5
538	Salvador	2927408	5
539	Santa Bárbara	2927507	5
540	Santa Brígida	2927606	5
541	Santa Cruz Cabrália	2927705	5
542	Santa Cruz da Vitória	2927804	5
543	Santa Inês	2927903	5
544	Santa Luzia	2928059	5
545	Santa Maria da Vitória	2928109	5
546	Santa Rita de Cássia	2928406	5
547	Santa Teresinha	2928505	5
548	Santaluz	2928000	5
549	Santana	2928208	5
550	Santanópolis	2928307	5
551	Santo Amaro	2928604	5
552	Santo Antônio de Jesus	2928703	5
553	Santo Estêvão	2928802	5
554	São Desidério	2928901	5
555	São Domingos	2928950	5
556	São Felipe	2929107	5
557	São Félix	2929008	5
558	São Félix do Coribe	2929057	5
559	São Francisco do Conde	2929206	5
560	São Gabriel	2929255	5
561	São Gonçalo dos Campos	2929305	5
562	São José da Vitória	2929354	5
563	São José do Jacuípe	2929370	5
564	São Miguel das Matas	2929404	5
565	São Sebastião do Passé	2929503	5
566	Sapeaçu	2929602	5
567	Sátiro Dias	2929701	5
568	Saubara	2929750	5
569	Saúde	2929800	5
570	Seabra	2929909	5
571	Sebastião Laranjeiras	2930006	5
572	Senhor do Bonfim	2930105	5
573	Sento Sé	2930204	5
574	Serra do Ramalho	2930154	5
575	Serra Dourada	2930303	5
576	Serra Preta	2930402	5
577	Serrinha	2930501	5
578	Serrolândia	2930600	5
579	Simões Filho	2930709	5
580	Sítio do Mato	2930758	5
581	Sítio do Quinto	2930766	5
582	Sobradinho	2930774	5
583	Souto Soares	2930808	5
584	Tabocas do Brejo Velho	2930907	5
585	Tanhaçu	2931004	5
586	Tanque Novo	2931053	5
587	Tanquinho	2931103	5
588	Taperoá	2931202	5
589	Tapiramutá	2931301	5
590	Teixeira de Freitas	2931350	5
591	Teodoro Sampaio	2931400	5
592	Teofilândia	2931509	5
593	Teolândia	2931608	5
594	Terra Nova	2931707	5
595	Tremedal	2931806	5
596	Tucano	2931905	5
597	Uauá	2932002	5
598	Ubaíra	2932101	5
599	Ubaitaba	2932200	5
600	Ubatã	2932309	5
601	Uibaí	2932408	5
602	Umburanas	2932457	5
603	Una	2932507	5
604	Urandi	2932606	5
605	Uruçuca	2932705	5
606	Utinga	2932804	5
607	Valença	2932903	5
608	Valente	2933000	5
609	Várzea da Roça	2933059	5
610	Várzea do Poço	2933109	5
611	Várzea Nova	2933158	5
612	Varzedo	2933174	5
613	Vera Cruz	2933208	5
614	Vereda	2933257	5
615	Vitória da Conquista	2933307	5
616	Wagner	2933406	5
617	Wanderley	2933455	5
618	Wenceslau Guimarães	2933505	5
619	Xique-Xique	2933604	5
620	Abaiara	2300101	6
621	Acarape	2300150	6
622	Acaraú	2300200	6
623	Acopiara	2300309	6
624	Aiuaba	2300408	6
625	Alcântaras	2300507	6
626	Altaneira	2300606	6
627	Alto Santo	2300705	6
628	Amontada	2300754	6
629	Antonina do Norte	2300804	6
630	Apuiarés	2300903	6
631	Aquiraz	2301000	6
632	Aracati	2301109	6
633	Aracoiaba	2301208	6
634	Ararendá	2301257	6
635	Araripe	2301307	6
636	Aratuba	2301406	6
637	Arneiroz	2301505	6
638	Assaré	2301604	6
639	Aurora	2301703	6
640	Baixio	2301802	6
641	Banabuiú	2301851	6
642	Barbalha	2301901	6
643	Barreira	2301950	6
644	Barro	2302008	6
645	Barroquinha	2302057	6
646	Baturité	2302107	6
647	Beberibe	2302206	6
648	Bela Cruz	2302305	6
649	Boa Viagem	2302404	6
650	Brejo Santo	2302503	6
651	Camocim	2302602	6
652	Campos Sales	2302701	6
653	Canindé	2302800	6
654	Capistrano	2302909	6
655	Caridade	2303006	6
656	Cariré	2303105	6
657	Caririaçu	2303204	6
658	Cariús	2303303	6
659	Carnaubal	2303402	6
660	Cascavel	2303501	6
661	Catarina	2303600	6
662	Catunda	2303659	6
663	Caucaia	2303709	6
664	Cedro	2303808	6
665	Chaval	2303907	6
666	Choró	2303931	6
667	Chorozinho	2303956	6
668	Coreaú	2304004	6
669	Crateús	2304103	6
670	Crato	2304202	6
671	Croatá	2304236	6
672	Cruz	2304251	6
673	Deputado Irapuan Pinheiro	2304269	6
674	Ererê	2304277	6
675	Eusébio	2304285	6
676	Farias Brito	2304301	6
677	Forquilha	2304350	6
678	Fortaleza	2304400	6
679	Fortim	2304459	6
680	Frecheirinha	2304509	6
681	General Sampaio	2304608	6
682	Graça	2304657	6
683	Granja	2304707	6
684	Granjeiro	2304806	6
685	Groaíras	2304905	6
686	Guaiúba	2304954	6
687	Guaraciaba do Norte	2305001	6
688	Guaramiranga	2305100	6
689	Hidrolândia	2305209	6
690	Horizonte	2305233	6
691	Ibaretama	2305266	6
692	Ibiapina	2305308	6
693	Ibicuitinga	2305332	6
694	Icapuí	2305357	6
695	Icó	2305407	6
696	Iguatu	2305506	6
697	Independência	2305605	6
698	Ipaporanga	2305654	6
699	Ipaumirim	2305704	6
700	Ipu	2305803	6
701	Ipueiras	2305902	6
702	Iracema	2306009	6
703	Irauçuba	2306108	6
704	Itaiçaba	2306207	6
705	Itaitinga	2306256	6
706	Itapajé	2306306	6
707	Itapipoca	2306405	6
708	Itapiúna	2306504	6
709	Itarema	2306553	6
710	Itatira	2306603	6
711	Jaguaretama	2306702	6
712	Jaguaribara	2306801	6
713	Jaguaribe	2306900	6
714	Jaguaruana	2307007	6
715	Jardim	2307106	6
716	Jati	2307205	6
717	Jijoca de Jericoacoara	2307254	6
718	Juazeiro do Norte	2307304	6
719	Jucás	2307403	6
720	Lavras da Mangabeira	2307502	6
721	Limoeiro do Norte	2307601	6
722	Madalena	2307635	6
723	Maracanaú	2307650	6
724	Maranguape	2307700	6
725	Marco	2307809	6
726	Martinópole	2307908	6
727	Massapê	2308005	6
728	Mauriti	2308104	6
729	Meruoca	2308203	6
730	Milagres	2308302	6
731	Milhã	2308351	6
732	Miraíma	2308377	6
733	Missão Velha	2308401	6
734	Mombaça	2308500	6
735	Monsenhor Tabosa	2308609	6
736	Morada Nova	2308708	6
737	Moraújo	2308807	6
738	Morrinhos	2308906	6
739	Mucambo	2309003	6
740	Mulungu	2309102	6
741	Nova Olinda	2309201	6
742	Nova Russas	2309300	6
743	Novo Oriente	2309409	6
744	Ocara	2309458	6
745	Orós	2309508	6
746	Pacajus	2309607	6
747	Pacatuba	2309706	6
748	Pacoti	2309805	6
749	Pacujá	2309904	6
750	Palhano	2310001	6
751	Palmácia	2310100	6
752	Paracuru	2310209	6
753	Paraipaba	2310258	6
754	Parambu	2310308	6
755	Paramoti	2310407	6
756	Pedra Branca	2310506	6
757	Penaforte	2310605	6
758	Pentecoste	2310704	6
759	Pereiro	2310803	6
760	Pindoretama	2310852	6
761	Piquet Carneiro	2310902	6
762	Pires Ferreira	2310951	6
763	Poranga	2311009	6
764	Porteiras	2311108	6
765	Potengi	2311207	6
766	Potiretama	2311231	6
767	Quiterianópolis	2311264	6
768	Quixadá	2311306	6
769	Quixelô	2311355	6
770	Quixeramobim	2311405	6
771	Quixeré	2311504	6
772	Redenção	2311603	6
773	Reriutaba	2311702	6
774	Russas	2311801	6
775	Saboeiro	2311900	6
776	Salitre	2311959	6
777	Santa Quitéria	2312205	6
778	Santana do Acaraú	2312007	6
779	Santana do Cariri	2312106	6
780	São Benedito	2312304	6
781	São Gonçalo do Amarante	2312403	6
782	São João do Jaguaribe	2312502	6
783	São Luís do Curu	2312601	6
784	Senador Pompeu	2312700	6
785	Senador Sá	2312809	6
786	Sobral	2312908	6
787	Solonópole	2313005	6
788	Tabuleiro do Norte	2313104	6
789	Tamboril	2313203	6
790	Tarrafas	2313252	6
791	Tauá	2313302	6
792	Tejuçuoca	2313351	6
793	Tianguá	2313401	6
794	Trairi	2313500	6
795	Tururu	2313559	6
796	Ubajara	2313609	6
797	Umari	2313708	6
798	Umirim	2313757	6
799	Uruburetama	2313807	6
800	Uruoca	2313906	6
801	Varjota	2313955	6
802	Várzea Alegre	2314003	6
803	Viçosa do Ceará	2314102	6
804	Brasília	5300108	7
805	Afonso Cláudio	3200102	8
806	Água Doce do Norte	3200169	8
807	Águia Branca	3200136	8
808	Alegre	3200201	8
809	Alfredo Chaves	3200300	8
810	Alto Rio Novo	3200359	8
811	Anchieta	3200409	8
812	Apiacá	3200508	8
813	Aracruz	3200607	8
814	Atilio Vivacqua	3200706	8
815	Baixo Guandu	3200805	8
816	Barra de São Francisco	3200904	8
817	Boa Esperança	3201001	8
818	Bom Jesus do Norte	3201100	8
819	Brejetuba	3201159	8
820	Cachoeiro de Itapemirim	3201209	8
821	Cariacica	3201308	8
822	Castelo	3201407	8
823	Colatina	3201506	8
824	Conceição da Barra	3201605	8
825	Conceição do Castelo	3201704	8
826	Divino de São Lourenço	3201803	8
827	Domingos Martins	3201902	8
828	Dores do Rio Preto	3202009	8
829	Ecoporanga	3202108	8
830	Fundão	3202207	8
831	Governador Lindenberg	3202256	8
832	Guaçuí	3202306	8
833	Guarapari	3202405	8
834	Ibatiba	3202454	8
835	Ibiraçu	3202504	8
836	Ibitirama	3202553	8
837	Iconha	3202603	8
838	Irupi	3202652	8
839	Itaguaçu	3202702	8
840	Itapemirim	3202801	8
841	Itarana	3202900	8
842	Iúna	3203007	8
843	Jaguaré	3203056	8
844	Jerônimo Monteiro	3203106	8
845	João Neiva	3203130	8
846	Laranja da Terra	3203163	8
847	Linhares	3203205	8
848	Mantenópolis	3203304	8
849	Marataízes	3203320	8
850	Marechal Floriano	3203346	8
851	Marilândia	3203353	8
852	Mimoso do Sul	3203403	8
853	Montanha	3203502	8
854	Mucurici	3203601	8
855	Muniz Freire	3203700	8
856	Muqui	3203809	8
857	Nova Venécia	3203908	8
858	Pancas	3204005	8
859	Pedro Canário	3204054	8
860	Pinheiros	3204104	8
861	Piúma	3204203	8
862	Ponto Belo	3204252	8
863	Presidente Kennedy	3204302	8
864	Rio Bananal	3204351	8
865	Rio Novo do Sul	3204401	8
866	Santa Leopoldina	3204500	8
867	Santa Maria de Jetibá	3204559	8
868	Santa Teresa	3204609	8
869	São Domingos do Norte	3204658	8
870	São Gabriel da Palha	3204708	8
871	São José do Calçado	3204807	8
872	São Mateus	3204906	8
873	São Roque do Canaã	3204955	8
874	Serra	3205002	8
875	Sooretama	3205010	8
876	Vargem Alta	3205036	8
877	Venda Nova do Imigrante	3205069	8
878	Viana	3205101	8
879	Vila Pavão	3205150	8
880	Vila Valério	3205176	8
881	Vila Velha	3205200	8
882	Vitória	3205309	8
883	Abadia de Goiás	5200050	9
884	Abadiânia	5200100	9
885	Acreúna	5200134	9
886	Adelândia	5200159	9
887	Água Fria de Goiás	5200175	9
888	Água Limpa	5200209	9
889	Águas Lindas de Goiás	5200258	9
890	Alexânia	5200308	9
891	Aloândia	5200506	9
892	Alto Horizonte	5200555	9
893	Alto Paraíso de Goiás	5200605	9
894	Alvorada do Norte	5200803	9
895	Amaralina	5200829	9
896	Americano do Brasil	5200852	9
897	Amorinópolis	5200902	9
898	Anápolis	5201108	9
899	Anhanguera	5201207	9
900	Anicuns	5201306	9
901	Aparecida de Goiânia	5201405	9
902	Aparecida do Rio Doce	5201454	9
903	Aporé	5201504	9
904	Araçu	5201603	9
905	Aragarças	5201702	9
906	Aragoiânia	5201801	9
907	Araguapaz	5202155	9
908	Arenópolis	5202353	9
909	Aruanã	5202502	9
910	Aurilândia	5202601	9
911	Avelinópolis	5202809	9
912	Baliza	5203104	9
913	Barro Alto	5203203	9
914	Bela Vista de Goiás	5203302	9
915	Bom Jardim de Goiás	5203401	9
916	Bom Jesus de Goiás	5203500	9
917	Bonfinópolis	5203559	9
918	Bonópolis	5203575	9
919	Brazabrantes	5203609	9
920	Britânia	5203807	9
921	Buriti Alegre	5203906	9
922	Buriti de Goiás	5203939	9
923	Buritinópolis	5203962	9
924	Cabeceiras	5204003	9
925	Cachoeira Alta	5204102	9
926	Cachoeira de Goiás	5204201	9
927	Cachoeira Dourada	5204250	9
928	Caçu	5204300	9
929	Caiapônia	5204409	9
930	Caldas Novas	5204508	9
931	Caldazinha	5204557	9
932	Campestre de Goiás	5204607	9
933	Campinaçu	5204656	9
934	Campinorte	5204706	9
935	Campo Alegre de Goiás	5204805	9
936	Campo Limpo de Goiás	5204854	9
937	Campos Belos	5204904	9
938	Campos Verdes	5204953	9
939	Carmo do Rio Verde	5205000	9
940	Castelândia	5205059	9
941	Catalão	5205109	9
942	Caturaí	5205208	9
943	Cavalcante	5205307	9
944	Ceres	5205406	9
945	Cezarina	5205455	9
946	Chapadão do Céu	5205471	9
947	Cidade Ocidental	5205497	9
948	Cocalzinho de Goiás	5205513	9
949	Colinas do Sul	5205521	9
950	Córrego do Ouro	5205703	9
951	Corumbá de Goiás	5205802	9
952	Corumbaíba	5205901	9
953	Cristalina	5206206	9
954	Cristianópolis	5206305	9
955	Crixás	5206404	9
956	Cromínia	5206503	9
957	Cumari	5206602	9
958	Damianópolis	5206701	9
959	Damolândia	5206800	9
960	Davinópolis	5206909	9
961	Diorama	5207105	9
962	Divinópolis de Goiás	5208301	9
963	Doverlândia	5207253	9
964	Edealina	5207352	9
965	Edéia	5207402	9
966	Estrela do Norte	5207501	9
967	Faina	5207535	9
968	Fazenda Nova	5207600	9
969	Firminópolis	5207808	9
970	Flores de Goiás	5207907	9
971	Formosa	5208004	9
972	Formoso	5208103	9
973	Gameleira de Goiás	5208152	9
974	Goianápolis	5208400	9
975	Goiandira	5208509	9
976	Goianésia	5208608	9
977	Goiânia	5208707	9
978	Goianira	5208806	9
979	Goiás	5208905	9
980	Goiatuba	5209101	9
981	Gouvelândia	5209150	9
982	Guapó	5209200	9
983	Guaraíta	5209291	9
984	Guarani de Goiás	5209408	9
985	Guarinos	5209457	9
986	Heitoraí	5209606	9
987	Hidrolândia	5209705	9
988	Hidrolina	5209804	9
989	Iaciara	5209903	9
990	Inaciolândia	5209937	9
991	Indiara	5209952	9
992	Inhumas	5210000	9
993	Ipameri	5210109	9
994	Ipiranga de Goiás	5210158	9
995	Iporá	5210208	9
996	Israelândia	5210307	9
997	Itaberaí	5210406	9
998	Itaguari	5210562	9
999	Itaguaru	5210604	9
1000	Itajá	5210802	9
1001	Itapaci	5210901	9
1002	Itapirapuã	5211008	9
1003	Itapuranga	5211206	9
1004	Itarumã	5211305	9
1005	Itauçu	5211404	9
1006	Itumbiara	5211503	9
1007	Ivolândia	5211602	9
1008	Jandaia	5211701	9
1009	Jaraguá	5211800	9
1010	Jataí	5211909	9
1011	Jaupaci	5212006	9
1012	Jesúpolis	5212055	9
1013	Joviânia	5212105	9
1014	Jussara	5212204	9
1015	Lagoa Santa	5212253	9
1016	Leopoldo de Bulhões	5212303	9
1017	Luziânia	5212501	9
1018	Mairipotaba	5212600	9
1019	Mambaí	5212709	9
1020	Mara Rosa	5212808	9
1021	Marzagão	5212907	9
1022	Matrinchã	5212956	9
1023	Maurilândia	5213004	9
1024	Mimoso de Goiás	5213053	9
1025	Minaçu	5213087	9
1026	Mineiros	5213103	9
1027	Moiporá	5213400	9
1028	Monte Alegre de Goiás	5213509	9
1029	Montes Claros de Goiás	5213707	9
1030	Montividiu	5213756	9
1031	Montividiu do Norte	5213772	9
1032	Morrinhos	5213806	9
1033	Morro Agudo de Goiás	5213855	9
1034	Mossâmedes	5213905	9
1035	Mozarlândia	5214002	9
1036	Mundo Novo	5214051	9
1037	Mutunópolis	5214101	9
1038	Nazário	5214408	9
1039	Nerópolis	5214507	9
1040	Niquelândia	5214606	9
1041	Nova América	5214705	9
1042	Nova Aurora	5214804	9
1043	Nova Crixás	5214838	9
1044	Nova Glória	5214861	9
1045	Nova Iguaçu de Goiás	5214879	9
1046	Nova Roma	5214903	9
1047	Nova Veneza	5215009	9
1048	Novo Brasil	5215207	9
1049	Novo Gama	5215231	9
1050	Novo Planalto	5215256	9
1051	Orizona	5215306	9
1052	Ouro Verde de Goiás	5215405	9
1053	Ouvidor	5215504	9
1054	Padre Bernardo	5215603	9
1055	Palestina de Goiás	5215652	9
1056	Palmeiras de Goiás	5215702	9
1057	Palmelo	5215801	9
1058	Palminópolis	5215900	9
1059	Panamá	5216007	9
1060	Paranaiguara	5216304	9
1061	Paraúna	5216403	9
1062	Perolândia	5216452	9
1063	Petrolina de Goiás	5216809	9
1064	Pilar de Goiás	5216908	9
1065	Piracanjuba	5217104	9
1066	Piranhas	5217203	9
1067	Pirenópolis	5217302	9
1068	Pires do Rio	5217401	9
1069	Planaltina	5217609	9
1070	Pontalina	5217708	9
1071	Porangatu	5218003	9
1072	Porteirão	5218052	9
1073	Portelândia	5218102	9
1074	Posse	5218300	9
1075	Professor Jamil	5218391	9
1076	Quirinópolis	5218508	9
1077	Rialma	5218607	9
1078	Rianápolis	5218706	9
1079	Rio Quente	5218789	9
1080	Rio Verde	5218805	9
1081	Rubiataba	5218904	9
1082	Sanclerlândia	5219001	9
1083	Santa Bárbara de Goiás	5219100	9
1084	Santa Cruz de Goiás	5219209	9
1085	Santa Fé de Goiás	5219258	9
1086	Santa Helena de Goiás	5219308	9
1087	Santa Isabel	5219357	9
1088	Santa Rita do Araguaia	5219407	9
1089	Santa Rita do Novo Destino	5219456	9
1090	Santa Rosa de Goiás	5219506	9
1091	Santa Tereza de Goiás	5219605	9
1092	Santa Terezinha de Goiás	5219704	9
1093	Santo Antônio da Barra	5219712	9
1094	Santo Antônio de Goiás	5219738	9
1095	Santo Antônio do Descoberto	5219753	9
1096	São Domingos	5219803	9
1097	São Francisco de Goiás	5219902	9
1098	São João da Paraúna	5220058	9
1099	São João d'Aliança	5220009	9
1100	São Luís de Montes Belos	5220108	9
1101	São Luíz do Norte	5220157	9
1102	São Miguel do Araguaia	5220207	9
1103	São Miguel do Passa Quatro	5220264	9
1104	São Patrício	5220280	9
1105	São Simão	5220405	9
1106	Senador Canedo	5220454	9
1107	Serranópolis	5220504	9
1108	Silvânia	5220603	9
1109	Simolândia	5220686	9
1110	Sítio d'Abadia	5220702	9
1111	Taquaral de Goiás	5221007	9
1112	Teresina de Goiás	5221080	9
1113	Terezópolis de Goiás	5221197	9
1114	Três Ranchos	5221304	9
1115	Trindade	5221403	9
1116	Trombas	5221452	9
1117	Turvânia	5221502	9
1118	Turvelândia	5221551	9
1119	Uirapuru	5221577	9
1120	Uruaçu	5221601	9
1121	Uruana	5221700	9
1122	Urutaí	5221809	9
1123	Valparaíso de Goiás	5221858	9
1124	Varjão	5221908	9
1125	Vianópolis	5222005	9
1126	Vicentinópolis	5222054	9
1127	Vila Boa	5222203	9
1128	Vila Propício	5222302	9
1129	Açailândia	2100055	10
1130	Afonso Cunha	2100105	10
1131	Água Doce do Maranhão	2100154	10
1132	Alcântara	2100204	10
1133	Aldeias Altas	2100303	10
1134	Altamira do Maranhão	2100402	10
1135	Alto Alegre do Maranhão	2100436	10
1136	Alto Alegre do Pindaré	2100477	10
1137	Alto Parnaíba	2100501	10
1138	Amapá do Maranhão	2100550	10
1139	Amarante do Maranhão	2100600	10
1140	Anajatuba	2100709	10
1141	Anapurus	2100808	10
1142	Apicum-Açu	2100832	10
1143	Araguanã	2100873	10
1144	Araioses	2100907	10
1145	Arame	2100956	10
1146	Arari	2101004	10
1147	Axixá	2101103	10
1148	Bacabal	2101202	10
1149	Bacabeira	2101251	10
1150	Bacuri	2101301	10
1151	Bacurituba	2101350	10
1152	Balsas	2101400	10
1153	Barão de Grajaú	2101509	10
1154	Barra do Corda	2101608	10
1155	Barreirinhas	2101707	10
1156	Bela Vista do Maranhão	2101772	10
1157	Belágua	2101731	10
1158	Benedito Leite	2101806	10
1159	Bequimão	2101905	10
1160	Bernardo do Mearim	2101939	10
1161	Boa Vista do Gurupi	2101970	10
1162	Bom Jardim	2102002	10
1163	Bom Jesus das Selvas	2102036	10
1164	Bom Lugar	2102077	10
1165	Brejo	2102101	10
1166	Brejo de Areia	2102150	10
1167	Buriti	2102200	10
1168	Buriti Bravo	2102309	10
1169	Buriticupu	2102325	10
1170	Buritirana	2102358	10
1171	Cachoeira Grande	2102374	10
1172	Cajapió	2102408	10
1173	Cajari	2102507	10
1174	Campestre do Maranhão	2102556	10
1175	Cândido Mendes	2102606	10
1176	Cantanhede	2102705	10
1177	Capinzal do Norte	2102754	10
1178	Carolina	2102804	10
1179	Carutapera	2102903	10
1180	Caxias	2103000	10
1181	Cedral	2103109	10
1182	Central do Maranhão	2103125	10
1183	Centro do Guilherme	2103158	10
1184	Centro Novo do Maranhão	2103174	10
1185	Chapadinha	2103208	10
1186	Cidelândia	2103257	10
1187	Codó	2103307	10
1188	Coelho Neto	2103406	10
1189	Colinas	2103505	10
1190	Conceição do Lago-Açu	2103554	10
1191	Coroatá	2103604	10
1192	Cururupu	2103703	10
1193	Davinópolis	2103752	10
1194	Dom Pedro	2103802	10
1195	Duque Bacelar	2103901	10
1196	Esperantinópolis	2104008	10
1197	Estreito	2104057	10
1198	Feira Nova do Maranhão	2104073	10
1199	Fernando Falcão	2104081	10
1200	Formosa da Serra Negra	2104099	10
1201	Fortaleza dos Nogueiras	2104107	10
1202	Fortuna	2104206	10
1203	Godofredo Viana	2104305	10
1204	Gonçalves Dias	2104404	10
1205	Governador Archer	2104503	10
1206	Governador Edison Lobão	2104552	10
1207	Governador Eugênio Barros	2104602	10
1208	Governador Luiz Rocha	2104628	10
1209	Governador Newton Bello	2104651	10
1210	Governador Nunes Freire	2104677	10
1211	Graça Aranha	2104701	10
1212	Grajaú	2104800	10
1213	Guimarães	2104909	10
1214	Humberto de Campos	2105005	10
1215	Icatu	2105104	10
1216	Igarapé do Meio	2105153	10
1217	Igarapé Grande	2105203	10
1218	Imperatriz	2105302	10
1219	Itaipava do Grajaú	2105351	10
1220	Itapecuru Mirim	2105401	10
1221	Itinga do Maranhão	2105427	10
1222	Jatobá	2105450	10
1223	Jenipapo dos Vieiras	2105476	10
1224	João Lisboa	2105500	10
1225	Joselândia	2105609	10
1226	Junco do Maranhão	2105658	10
1227	Lago da Pedra	2105708	10
1228	Lago do Junco	2105807	10
1229	Lago dos Rodrigues	2105948	10
1230	Lago Verde	2105906	10
1231	Lagoa do Mato	2105922	10
1232	Lagoa Grande do Maranhão	2105963	10
1233	Lajeado Novo	2105989	10
1234	Lima Campos	2106003	10
1235	Loreto	2106102	10
1236	Luís Domingues	2106201	10
1237	Magalhães de Almeida	2106300	10
1238	Maracaçumé	2106326	10
1239	Marajá do Sena	2106359	10
1240	Maranhãozinho	2106375	10
1241	Mata Roma	2106409	10
1242	Matinha	2106508	10
1243	Matões	2106607	10
1244	Matões do Norte	2106631	10
1245	Milagres do Maranhão	2106672	10
1246	Mirador	2106706	10
1247	Miranda do Norte	2106755	10
1248	Mirinzal	2106805	10
1249	Monção	2106904	10
1250	Montes Altos	2107001	10
1251	Morros	2107100	10
1252	Nina Rodrigues	2107209	10
1253	Nova Colinas	2107258	10
1254	Nova Iorque	2107308	10
1255	Nova Olinda do Maranhão	2107357	10
1256	Olho d'Água das Cunhãs	2107407	10
1257	Olinda Nova do Maranhão	2107456	10
1258	Paço do Lumiar	2107506	10
1259	Palmeirândia	2107605	10
1260	Paraibano	2107704	10
1261	Parnarama	2107803	10
1262	Passagem Franca	2107902	10
1263	Pastos Bons	2108009	10
1264	Paulino Neves	2108058	10
1265	Paulo Ramos	2108108	10
1266	Pedreiras	2108207	10
1267	Pedro do Rosário	2108256	10
1268	Penalva	2108306	10
1269	Peri Mirim	2108405	10
1270	Peritoró	2108454	10
1271	Pindaré-Mirim	2108504	10
1272	Pinheiro	2108603	10
1273	Pio XII	2108702	10
1274	Pirapemas	2108801	10
1275	Poção de Pedras	2108900	10
1276	Porto Franco	2109007	10
1277	Porto Rico do Maranhão	2109056	10
1278	Presidente Dutra	2109106	10
1279	Presidente Juscelino	2109205	10
1280	Presidente Médici	2109239	10
1281	Presidente Sarney	2109270	10
1282	Presidente Vargas	2109304	10
1283	Primeira Cruz	2109403	10
1284	Raposa	2109452	10
1285	Riachão	2109502	10
1286	Ribamar Fiquene	2109551	10
1287	Rosário	2109601	10
1288	Sambaíba	2109700	10
1289	Santa Filomena do Maranhão	2109759	10
1290	Santa Helena	2109809	10
1291	Santa Inês	2109908	10
1292	Santa Luzia	2110005	10
1293	Santa Luzia do Paruá	2110039	10
1294	Santa Quitéria do Maranhão	2110104	10
1295	Santa Rita	2110203	10
1296	Santana do Maranhão	2110237	10
1297	Santo Amaro do Maranhão	2110278	10
1298	Santo Antônio dos Lopes	2110302	10
1299	São Benedito do Rio Preto	2110401	10
1300	São Bento	2110500	10
1301	São Bernardo	2110609	10
1302	São Domingos do Azeitão	2110658	10
1303	São Domingos do Maranhão	2110708	10
1304	São Félix de Balsas	2110807	10
1305	São Francisco do Brejão	2110856	10
1306	São Francisco do Maranhão	2110906	10
1307	São João Batista	2111003	10
1308	São João do Carú	2111029	10
1309	São João do Paraíso	2111052	10
1310	São João do Soter	2111078	10
1311	São João dos Patos	2111102	10
1312	São José de Ribamar	2111201	10
1313	São José dos Basílios	2111250	10
1314	São Luís	2111300	10
1315	São Luís Gonzaga do Maranhão	2111409	10
1316	São Mateus do Maranhão	2111508	10
1317	São Pedro da Água Branca	2111532	10
1318	São Pedro dos Crentes	2111573	10
1319	São Raimundo das Mangabeiras	2111607	10
1320	São Raimundo do Doca Bezerra	2111631	10
1321	São Roberto	2111672	10
1322	São Vicente Ferrer	2111706	10
1323	Satubinha	2111722	10
1324	Senador Alexandre Costa	2111748	10
1325	Senador La Rocque	2111763	10
1326	Serrano do Maranhão	2111789	10
1327	Sítio Novo	2111805	10
1328	Sucupira do Norte	2111904	10
1329	Sucupira do Riachão	2111953	10
1330	Tasso Fragoso	2112001	10
1331	Timbiras	2112100	10
1332	Timon	2112209	10
1333	Trizidela do Vale	2112233	10
1334	Tufilândia	2112274	10
1335	Tuntum	2112308	10
1336	Turiaçu	2112407	10
1337	Turilândia	2112456	10
1338	Tutóia	2112506	10
1339	Urbano Santos	2112605	10
1340	Vargem Grande	2112704	10
1341	Viana	2112803	10
1342	Vila Nova dos Martírios	2112852	10
1343	Vitória do Mearim	2112902	10
1344	Vitorino Freire	2113009	10
1345	Zé Doca	2114007	10
1346	Abadia dos Dourados	3100104	11
1347	Abaeté	3100203	11
1348	Abre Campo	3100302	11
1349	Acaiaca	3100401	11
1350	Açucena	3100500	11
1351	Água Boa	3100609	11
1352	Água Comprida	3100708	11
1353	Aguanil	3100807	11
1354	Águas Formosas	3100906	11
1355	Águas Vermelhas	3101003	11
1356	Aimorés	3101102	11
1357	Aiuruoca	3101201	11
1358	Alagoa	3101300	11
1359	Albertina	3101409	11
1360	Além Paraíba	3101508	11
1361	Alfenas	3101607	11
1362	Alfredo Vasconcelos	3101631	11
1363	Almenara	3101706	11
1364	Alpercata	3101805	11
1365	Alpinópolis	3101904	11
1366	Alterosa	3102001	11
1367	Alto Caparaó	3102050	11
1368	Alto Jequitibá	3153509	11
1369	Alto Rio Doce	3102100	11
1370	Alvarenga	3102209	11
1371	Alvinópolis	3102308	11
1372	Alvorada de Minas	3102407	11
1373	Amparo do Serra	3102506	11
1374	Andradas	3102605	11
1375	Andrelândia	3102803	11
1376	Angelândia	3102852	11
1377	Antônio Carlos	3102902	11
1378	Antônio Dias	3103009	11
1379	Antônio Prado de Minas	3103108	11
1380	Araçaí	3103207	11
1381	Aracitaba	3103306	11
1382	Araçuaí	3103405	11
1383	Araguari	3103504	11
1384	Arantina	3103603	11
1385	Araponga	3103702	11
1386	Araporã	3103751	11
1387	Arapuá	3103801	11
1388	Araújos	3103900	11
1389	Araxá	3104007	11
1390	Arceburgo	3104106	11
1391	Arcos	3104205	11
1392	Areado	3104304	11
1393	Argirita	3104403	11
1394	Aricanduva	3104452	11
1395	Arinos	3104502	11
1396	Astolfo Dutra	3104601	11
1397	Ataléia	3104700	11
1398	Augusto de Lima	3104809	11
1399	Baependi	3104908	11
1400	Baldim	3105004	11
1401	Bambuí	3105103	11
1402	Bandeira	3105202	11
1403	Bandeira do Sul	3105301	11
1404	Barão de Cocais	3105400	11
1405	Barão de Monte Alto	3105509	11
1406	Barbacena	3105608	11
1407	Barra Longa	3105707	11
1408	Barroso	3105905	11
1409	Bela Vista de Minas	3106002	11
1410	Belmiro Braga	3106101	11
1411	Belo Horizonte	3106200	11
1412	Belo Oriente	3106309	11
1413	Belo Vale	3106408	11
1414	Berilo	3106507	11
1415	Berizal	3106655	11
1416	Bertópolis	3106606	11
1417	Betim	3106705	11
1418	Bias Fortes	3106804	11
1419	Bicas	3106903	11
1420	Biquinhas	3107000	11
1421	Boa Esperança	3107109	11
1422	Bocaina de Minas	3107208	11
1423	Bocaiúva	3107307	11
1424	Bom Despacho	3107406	11
1425	Bom Jardim de Minas	3107505	11
1426	Bom Jesus da Penha	3107604	11
1427	Bom Jesus do Amparo	3107703	11
1428	Bom Jesus do Galho	3107802	11
1429	Bom Repouso	3107901	11
1430	Bom Sucesso	3108008	11
1431	Bonfim	3108107	11
1432	Bonfinópolis de Minas	3108206	11
1433	Bonito de Minas	3108255	11
1434	Borda da Mata	3108305	11
1435	Botelhos	3108404	11
1436	Botumirim	3108503	11
1437	Brás Pires	3108701	11
1438	Brasilândia de Minas	3108552	11
1439	Brasília de Minas	3108602	11
1440	Braúnas	3108800	11
1441	Brazópolis	3108909	11
1442	Brumadinho	3109006	11
1443	Bueno Brandão	3109105	11
1444	Buenópolis	3109204	11
1445	Bugre	3109253	11
1446	Buritis	3109303	11
1447	Buritizeiro	3109402	11
1448	Cabeceira Grande	3109451	11
1449	Cabo Verde	3109501	11
1450	Cachoeira da Prata	3109600	11
1451	Cachoeira de Minas	3109709	11
1452	Cachoeira de Pajeú	3102704	11
1453	Cachoeira Dourada	3109808	11
1454	Caetanópolis	3109907	11
1455	Caeté	3110004	11
1456	Caiana	3110103	11
1457	Cajuri	3110202	11
1458	Caldas	3110301	11
1459	Camacho	3110400	11
1460	Camanducaia	3110509	11
1461	Cambuí	3110608	11
1462	Cambuquira	3110707	11
1463	Campanário	3110806	11
1464	Campanha	3110905	11
1465	Campestre	3111002	11
1466	Campina Verde	3111101	11
1467	Campo Azul	3111150	11
1468	Campo Belo	3111200	11
1469	Campo do Meio	3111309	11
1470	Campo Florido	3111408	11
1471	Campos Altos	3111507	11
1472	Campos Gerais	3111606	11
1473	Cana Verde	3111903	11
1474	Canaã	3111705	11
1475	Canápolis	3111804	11
1476	Candeias	3112000	11
1477	Cantagalo	3112059	11
1478	Caparaó	3112109	11
1479	Capela Nova	3112208	11
1480	Capelinha	3112307	11
1481	Capetinga	3112406	11
1482	Capim Branco	3112505	11
1483	Capinópolis	3112604	11
1484	Capitão Andrade	3112653	11
1485	Capitão Enéas	3112703	11
1486	Capitólio	3112802	11
1487	Caputira	3112901	11
1488	Caraí	3113008	11
1489	Caranaíba	3113107	11
1490	Carandaí	3113206	11
1491	Carangola	3113305	11
1492	Caratinga	3113404	11
1493	Carbonita	3113503	11
1494	Careaçu	3113602	11
1495	Carlos Chagas	3113701	11
1496	Carmésia	3113800	11
1497	Carmo da Cachoeira	3113909	11
1498	Carmo da Mata	3114006	11
1499	Carmo de Minas	3114105	11
1500	Carmo do Cajuru	3114204	11
1501	Carmo do Paranaíba	3114303	11
1502	Carmo do Rio Claro	3114402	11
1503	Carmópolis de Minas	3114501	11
1504	Carneirinho	3114550	11
1505	Carrancas	3114600	11
1506	Carvalhópolis	3114709	11
1507	Carvalhos	3114808	11
1508	Casa Grande	3114907	11
1509	Cascalho Rico	3115003	11
1510	Cássia	3115102	11
1511	Cataguases	3115300	11
1512	Catas Altas	3115359	11
1513	Catas Altas da Noruega	3115409	11
1514	Catuji	3115458	11
1515	Catuti	3115474	11
1516	Caxambu	3115508	11
1517	Cedro do Abaeté	3115607	11
1518	Central de Minas	3115706	11
1519	Centralina	3115805	11
1520	Chácara	3115904	11
1521	Chalé	3116001	11
1522	Chapada do Norte	3116100	11
1523	Chapada Gaúcha	3116159	11
1524	Chiador	3116209	11
1525	Cipotânea	3116308	11
1526	Claraval	3116407	11
1527	Claro dos Poções	3116506	11
1528	Cláudio	3116605	11
1529	Coimbra	3116704	11
1530	Coluna	3116803	11
1531	Comendador Gomes	3116902	11
1532	Comercinho	3117009	11
1533	Conceição da Aparecida	3117108	11
1534	Conceição da Barra de Minas	3115201	11
1535	Conceição das Alagoas	3117306	11
1536	Conceição das Pedras	3117207	11
1537	Conceição de Ipanema	3117405	11
1538	Conceição do Mato Dentro	3117504	11
1539	Conceição do Pará	3117603	11
1540	Conceição do Rio Verde	3117702	11
1541	Conceição dos Ouros	3117801	11
1542	Cônego Marinho	3117836	11
1543	Confins	3117876	11
1544	Congonhal	3117900	11
1545	Congonhas	3118007	11
1546	Congonhas do Norte	3118106	11
1547	Conquista	3118205	11
1548	Conselheiro Lafaiete	3118304	11
1549	Conselheiro Pena	3118403	11
1550	Consolação	3118502	11
1551	Contagem	3118601	11
1552	Coqueiral	3118700	11
1553	Coração de Jesus	3118809	11
1554	Cordisburgo	3118908	11
1555	Cordislândia	3119005	11
1556	Corinto	3119104	11
1557	Coroaci	3119203	11
1558	Coromandel	3119302	11
1559	Coronel Fabriciano	3119401	11
1560	Coronel Murta	3119500	11
1561	Coronel Pacheco	3119609	11
1562	Coronel Xavier Chaves	3119708	11
1563	Córrego Danta	3119807	11
1564	Córrego do Bom Jesus	3119906	11
1565	Córrego Fundo	3119955	11
1566	Córrego Novo	3120003	11
1567	Couto de Magalhães de Minas	3120102	11
1568	Crisólita	3120151	11
1569	Cristais	3120201	11
1570	Cristália	3120300	11
1571	Cristiano Otoni	3120409	11
1572	Cristina	3120508	11
1573	Crucilândia	3120607	11
1574	Cruzeiro da Fortaleza	3120706	11
1575	Cruzília	3120805	11
1576	Cuparaque	3120839	11
1577	Curral de Dentro	3120870	11
1578	Curvelo	3120904	11
1579	Datas	3121001	11
1580	Delfim Moreira	3121100	11
1581	Delfinópolis	3121209	11
1582	Delta	3121258	11
1583	Descoberto	3121308	11
1584	Desterro de Entre Rios	3121407	11
1585	Desterro do Melo	3121506	11
1586	Diamantina	3121605	11
1587	Diogo de Vasconcelos	3121704	11
1588	Dionísio	3121803	11
1589	Divinésia	3121902	11
1590	Divino	3122009	11
1591	Divino das Laranjeiras	3122108	11
1592	Divinolândia de Minas	3122207	11
1593	Divinópolis	3122306	11
1594	Divisa Alegre	3122355	11
1595	Divisa Nova	3122405	11
1596	Divisópolis	3122454	11
1597	Dom Bosco	3122470	11
1598	Dom Cavati	3122504	11
1599	Dom Joaquim	3122603	11
1600	Dom Silvério	3122702	11
1601	Dom Viçoso	3122801	11
1602	Dona Eusébia	3122900	11
1603	Dores de Campos	3123007	11
1604	Dores de Guanhães	3123106	11
1605	Dores do Indaiá	3123205	11
1606	Dores do Turvo	3123304	11
1607	Doresópolis	3123403	11
1608	Douradoquara	3123502	11
1609	Durandé	3123528	11
1610	Elói Mendes	3123601	11
1611	Engenheiro Caldas	3123700	11
1612	Engenheiro Navarro	3123809	11
1613	Entre Folhas	3123858	11
1614	Entre Rios de Minas	3123908	11
1615	Ervália	3124005	11
1616	Esmeraldas	3124104	11
1617	Espera Feliz	3124203	11
1618	Espinosa	3124302	11
1619	Espírito Santo do Dourado	3124401	11
1620	Estiva	3124500	11
1621	Estrela Dalva	3124609	11
1622	Estrela do Indaiá	3124708	11
1623	Estrela do Sul	3124807	11
1624	Eugenópolis	3124906	11
1625	Ewbank da Câmara	3125002	11
1626	Extrema	3125101	11
1627	Fama	3125200	11
1628	Faria Lemos	3125309	11
1629	Felício dos Santos	3125408	11
1630	Felisburgo	3125606	11
1631	Felixlândia	3125705	11
1632	Fernandes Tourinho	3125804	11
1633	Ferros	3125903	11
1634	Fervedouro	3125952	11
1635	Florestal	3126000	11
1636	Formiga	3126109	11
1637	Formoso	3126208	11
1638	Fortaleza de Minas	3126307	11
1639	Fortuna de Minas	3126406	11
1640	Francisco Badaró	3126505	11
1641	Francisco Dumont	3126604	11
1642	Francisco Sá	3126703	11
1643	Franciscópolis	3126752	11
1644	Frei Gaspar	3126802	11
1645	Frei Inocêncio	3126901	11
1646	Frei Lagonegro	3126950	11
1647	Fronteira	3127008	11
1648	Fronteira dos Vales	3127057	11
1649	Fruta de Leite	3127073	11
1650	Frutal	3127107	11
1651	Funilândia	3127206	11
1652	Galiléia	3127305	11
1653	Gameleiras	3127339	11
1654	Glaucilândia	3127354	11
1655	Goiabeira	3127370	11
1656	Goianá	3127388	11
1657	Gonçalves	3127404	11
1658	Gonzaga	3127503	11
1659	Gouveia	3127602	11
1660	Governador Valadares	3127701	11
1661	Grão Mogol	3127800	11
1662	Grupiara	3127909	11
1663	Guanhães	3128006	11
1664	Guapé	3128105	11
1665	Guaraciaba	3128204	11
1666	Guaraciama	3128253	11
1667	Guaranésia	3128303	11
1668	Guarani	3128402	11
1669	Guarará	3128501	11
1670	Guarda-Mor	3128600	11
1671	Guaxupé	3128709	11
1672	Guidoval	3128808	11
1673	Guimarânia	3128907	11
1674	Guiricema	3129004	11
1675	Gurinhatã	3129103	11
1676	Heliodora	3129202	11
1677	Iapu	3129301	11
1678	Ibertioga	3129400	11
1679	Ibiá	3129509	11
1680	Ibiaí	3129608	11
1681	Ibiracatu	3129657	11
1682	Ibiraci	3129707	11
1683	Ibirité	3129806	11
1684	Ibitiúra de Minas	3129905	11
1685	Ibituruna	3130002	11
1686	Icaraí de Minas	3130051	11
1687	Igarapé	3130101	11
1688	Igaratinga	3130200	11
1689	Iguatama	3130309	11
1690	Ijaci	3130408	11
1691	Ilicínea	3130507	11
1692	Imbé de Minas	3130556	11
1693	Inconfidentes	3130606	11
1694	Indaiabira	3130655	11
1695	Indianópolis	3130705	11
1696	Ingaí	3130804	11
1697	Inhapim	3130903	11
1698	Inhaúma	3131000	11
1699	Inimutaba	3131109	11
1700	Ipaba	3131158	11
1701	Ipanema	3131208	11
1702	Ipatinga	3131307	11
1703	Ipiaçu	3131406	11
1704	Ipuiúna	3131505	11
1705	Iraí de Minas	3131604	11
1706	Itabira	3131703	11
1707	Itabirinha	3131802	11
1708	Itabirito	3131901	11
1709	Itacambira	3132008	11
1710	Itacarambi	3132107	11
1711	Itaguara	3132206	11
1712	Itaipé	3132305	11
1713	Itajubá	3132404	11
1714	Itamarandiba	3132503	11
1715	Itamarati de Minas	3132602	11
1716	Itambacuri	3132701	11
1717	Itambé do Mato Dentro	3132800	11
1718	Itamogi	3132909	11
1719	Itamonte	3133006	11
1720	Itanhandu	3133105	11
1721	Itanhomi	3133204	11
1722	Itaobim	3133303	11
1723	Itapagipe	3133402	11
1724	Itapecerica	3133501	11
1725	Itapeva	3133600	11
1726	Itatiaiuçu	3133709	11
1727	Itaú de Minas	3133758	11
1728	Itaúna	3133808	11
1729	Itaverava	3133907	11
1730	Itinga	3134004	11
1731	Itueta	3134103	11
1732	Ituiutaba	3134202	11
1733	Itumirim	3134301	11
1734	Iturama	3134400	11
1735	Itutinga	3134509	11
1736	Jaboticatubas	3134608	11
1737	Jacinto	3134707	11
1738	Jacuí	3134806	11
1739	Jacutinga	3134905	11
1740	Jaguaraçu	3135001	11
1741	Jaíba	3135050	11
1742	Jampruca	3135076	11
1743	Janaúba	3135100	11
1744	Januária	3135209	11
1745	Japaraíba	3135308	11
1746	Japonvar	3135357	11
1747	Jeceaba	3135407	11
1748	Jenipapo de Minas	3135456	11
1749	Jequeri	3135506	11
1750	Jequitaí	3135605	11
1751	Jequitibá	3135704	11
1752	Jequitinhonha	3135803	11
1753	Jesuânia	3135902	11
1754	Joaíma	3136009	11
1755	Joanésia	3136108	11
1756	João Monlevade	3136207	11
1757	João Pinheiro	3136306	11
1758	Joaquim Felício	3136405	11
1759	Jordânia	3136504	11
1760	José Gonçalves de Minas	3136520	11
1761	José Raydan	3136553	11
1762	Josenópolis	3136579	11
1763	Juatuba	3136652	11
1764	Juiz de Fora	3136702	11
1765	Juramento	3136801	11
1766	Juruaia	3136900	11
1767	Juvenília	3136959	11
1768	Ladainha	3137007	11
1769	Lagamar	3137106	11
1770	Lagoa da Prata	3137205	11
1771	Lagoa dos Patos	3137304	11
1772	Lagoa Dourada	3137403	11
1773	Lagoa Formosa	3137502	11
1774	Lagoa Grande	3137536	11
1775	Lagoa Santa	3137601	11
1776	Lajinha	3137700	11
1777	Lambari	3137809	11
1778	Lamim	3137908	11
1779	Laranjal	3138005	11
1780	Lassance	3138104	11
1781	Lavras	3138203	11
1782	Leandro Ferreira	3138302	11
1783	Leme do Prado	3138351	11
1784	Leopoldina	3138401	11
1785	Liberdade	3138500	11
1786	Lima Duarte	3138609	11
1787	Limeira do Oeste	3138625	11
1788	Lontra	3138658	11
1789	Luisburgo	3138674	11
1790	Luislândia	3138682	11
1791	Luminárias	3138708	11
1792	Luz	3138807	11
1793	Machacalis	3138906	11
1794	Machado	3139003	11
1795	Madre de Deus de Minas	3139102	11
1796	Malacacheta	3139201	11
1797	Mamonas	3139250	11
1798	Manga	3139300	11
1799	Manhuaçu	3139409	11
1800	Manhumirim	3139508	11
1801	Mantena	3139607	11
1802	Mar de Espanha	3139805	11
1803	Maravilhas	3139706	11
1804	Maria da Fé	3139904	11
1805	Mariana	3140001	11
1806	Marilac	3140100	11
1807	Mário Campos	3140159	11
1808	Maripá de Minas	3140209	11
1809	Marliéria	3140308	11
1810	Marmelópolis	3140407	11
1811	Martinho Campos	3140506	11
1812	Martins Soares	3140530	11
1813	Mata Verde	3140555	11
1814	Materlândia	3140605	11
1815	Mateus Leme	3140704	11
1816	Mathias Lobato	3171501	11
1817	Matias Barbosa	3140803	11
1818	Matias Cardoso	3140852	11
1819	Matipó	3140902	11
1820	Mato Verde	3141009	11
1821	Matozinhos	3141108	11
1822	Matutina	3141207	11
1823	Medeiros	3141306	11
1824	Medina	3141405	11
1825	Mendes Pimentel	3141504	11
1826	Mercês	3141603	11
1827	Mesquita	3141702	11
1828	Minas Novas	3141801	11
1829	Minduri	3141900	11
1830	Mirabela	3142007	11
1831	Miradouro	3142106	11
1832	Miraí	3142205	11
1833	Miravânia	3142254	11
1834	Moeda	3142304	11
1835	Moema	3142403	11
1836	Monjolos	3142502	11
1837	Monsenhor Paulo	3142601	11
1838	Montalvânia	3142700	11
1839	Monte Alegre de Minas	3142809	11
1840	Monte Azul	3142908	11
1841	Monte Belo	3143005	11
1842	Monte Carmelo	3143104	11
1843	Monte Formoso	3143153	11
1844	Monte Santo de Minas	3143203	11
1845	Monte Sião	3143401	11
1846	Montes Claros	3143302	11
1847	Montezuma	3143450	11
1848	Morada Nova de Minas	3143500	11
1849	Morro da Garça	3143609	11
1850	Morro do Pilar	3143708	11
1851	Munhoz	3143807	11
1852	Muriaé	3143906	11
1853	Mutum	3144003	11
1854	Muzambinho	3144102	11
1855	Nacip Raydan	3144201	11
1856	Nanuque	3144300	11
1857	Naque	3144359	11
1858	Natalândia	3144375	11
1859	Natércia	3144409	11
1860	Nazareno	3144508	11
1861	Nepomuceno	3144607	11
1862	Ninheira	3144656	11
1863	Nova Belém	3144672	11
1864	Nova Era	3144706	11
1865	Nova Lima	3144805	11
1866	Nova Módica	3144904	11
1867	Nova Ponte	3145000	11
1868	Nova Porteirinha	3145059	11
1869	Nova Resende	3145109	11
1870	Nova Serrana	3145208	11
1871	Nova União	3136603	11
1872	Novo Cruzeiro	3145307	11
1873	Novo Oriente de Minas	3145356	11
1874	Novorizonte	3145372	11
1875	Olaria	3145406	11
1876	Olhos-d'Água	3145455	11
1877	Olímpio Noronha	3145505	11
1878	Oliveira	3145604	11
1879	Oliveira Fortes	3145703	11
1880	Onça de Pitangui	3145802	11
1881	Oratórios	3145851	11
1882	Orizânia	3145877	11
1883	Ouro Branco	3145901	11
1884	Ouro Fino	3146008	11
1885	Ouro Preto	3146107	11
1886	Ouro Verde de Minas	3146206	11
1887	Padre Carvalho	3146255	11
1888	Padre Paraíso	3146305	11
1889	Pai Pedro	3146552	11
1890	Paineiras	3146404	11
1891	Pains	3146503	11
1892	Paiva	3146602	11
1893	Palma	3146701	11
1894	Palmópolis	3146750	11
1895	Papagaios	3146909	11
1896	Pará de Minas	3147105	11
1897	Paracatu	3147006	11
1898	Paraguaçu	3147204	11
1899	Paraisópolis	3147303	11
1900	Paraopeba	3147402	11
1901	Passa Quatro	3147600	11
1902	Passa Tempo	3147709	11
1903	Passa-Vinte	3147808	11
1904	Passabém	3147501	11
1905	Passos	3147907	11
1906	Patis	3147956	11
1907	Patos de Minas	3148004	11
1908	Patrocínio	3148103	11
1909	Patrocínio do Muriaé	3148202	11
1910	Paula Cândido	3148301	11
1911	Paulistas	3148400	11
1912	Pavão	3148509	11
1913	Peçanha	3148608	11
1914	Pedra Azul	3148707	11
1915	Pedra Bonita	3148756	11
1916	Pedra do Anta	3148806	11
1917	Pedra do Indaiá	3148905	11
1918	Pedra Dourada	3149002	11
1919	Pedralva	3149101	11
1920	Pedras de Maria da Cruz	3149150	11
1921	Pedrinópolis	3149200	11
1922	Pedro Leopoldo	3149309	11
1923	Pedro Teixeira	3149408	11
1924	Pequeri	3149507	11
1925	Pequi	3149606	11
1926	Perdigão	3149705	11
1927	Perdizes	3149804	11
1928	Perdões	3149903	11
1929	Periquito	3149952	11
1930	Pescador	3150000	11
1931	Piau	3150109	11
1932	Piedade de Caratinga	3150158	11
1933	Piedade de Ponte Nova	3150208	11
1934	Piedade do Rio Grande	3150307	11
1935	Piedade dos Gerais	3150406	11
1936	Pimenta	3150505	11
1937	Pingo-d'Água	3150539	11
1938	Pintópolis	3150570	11
1939	Piracema	3150604	11
1940	Pirajuba	3150703	11
1941	Piranga	3150802	11
1942	Piranguçu	3150901	11
1943	Piranguinho	3151008	11
1944	Pirapetinga	3151107	11
1945	Pirapora	3151206	11
1946	Piraúba	3151305	11
1947	Pitangui	3151404	11
1948	Piumhi	3151503	11
1949	Planura	3151602	11
1950	Poço Fundo	3151701	11
1951	Poços de Caldas	3151800	11
1952	Pocrane	3151909	11
1953	Pompéu	3152006	11
1954	Ponte Nova	3152105	11
1955	Ponto Chique	3152131	11
1956	Ponto dos Volantes	3152170	11
1957	Porteirinha	3152204	11
1958	Porto Firme	3152303	11
1959	Poté	3152402	11
1960	Pouso Alegre	3152501	11
1961	Pouso Alto	3152600	11
1962	Prados	3152709	11
1963	Prata	3152808	11
1964	Pratápolis	3152907	11
1965	Pratinha	3153004	11
1966	Presidente Bernardes	3153103	11
1967	Presidente Juscelino	3153202	11
1968	Presidente Kubitschek	3153301	11
1969	Presidente Olegário	3153400	11
1970	Prudente de Morais	3153608	11
1971	Quartel Geral	3153707	11
1972	Queluzito	3153806	11
1973	Raposos	3153905	11
1974	Raul Soares	3154002	11
1975	Recreio	3154101	11
1976	Reduto	3154150	11
1977	Resende Costa	3154200	11
1978	Resplendor	3154309	11
1979	Ressaquinha	3154408	11
1980	Riachinho	3154457	11
1981	Riacho dos Machados	3154507	11
1982	Ribeirão das Neves	3154606	11
1983	Ribeirão Vermelho	3154705	11
1984	Rio Acima	3154804	11
1985	Rio Casca	3154903	11
1986	Rio do Prado	3155108	11
1987	Rio Doce	3155009	11
1988	Rio Espera	3155207	11
1989	Rio Manso	3155306	11
1990	Rio Novo	3155405	11
1991	Rio Paranaíba	3155504	11
1992	Rio Pardo de Minas	3155603	11
1993	Rio Piracicaba	3155702	11
1994	Rio Pomba	3155801	11
1995	Rio Preto	3155900	11
1996	Rio Vermelho	3156007	11
1997	Ritápolis	3156106	11
1998	Rochedo de Minas	3156205	11
1999	Rodeiro	3156304	11
2000	Romaria	3156403	11
2001	Rosário da Limeira	3156452	11
2002	Rubelita	3156502	11
2003	Rubim	3156601	11
2004	Sabará	3156700	11
2005	Sabinópolis	3156809	11
2006	Sacramento	3156908	11
2007	Salinas	3157005	11
2008	Salto da Divisa	3157104	11
2009	Santa Bárbara	3157203	11
2010	Santa Bárbara do Leste	3157252	11
2011	Santa Bárbara do Monte Verde	3157278	11
2012	Santa Bárbara do Tugúrio	3157302	11
2013	Santa Cruz de Minas	3157336	11
2014	Santa Cruz de Salinas	3157377	11
2015	Santa Cruz do Escalvado	3157401	11
2016	Santa Efigênia de Minas	3157500	11
2017	Santa Fé de Minas	3157609	11
2018	Santa Helena de Minas	3157658	11
2019	Santa Juliana	3157708	11
2020	Santa Luzia	3157807	11
2021	Santa Margarida	3157906	11
2022	Santa Maria de Itabira	3158003	11
2023	Santa Maria do Salto	3158102	11
2024	Santa Maria do Suaçuí	3158201	11
2025	Santa Rita de Caldas	3159209	11
2026	Santa Rita de Ibitipoca	3159407	11
2027	Santa Rita de Jacutinga	3159308	11
2028	Santa Rita de Minas	3159357	11
2029	Santa Rita do Itueto	3159506	11
2030	Santa Rita do Sapucaí	3159605	11
2031	Santa Rosa da Serra	3159704	11
2032	Santa Vitória	3159803	11
2033	Santana da Vargem	3158300	11
2034	Santana de Cataguases	3158409	11
2035	Santana de Pirapama	3158508	11
2036	Santana do Deserto	3158607	11
2037	Santana do Garambéu	3158706	11
2038	Santana do Jacaré	3158805	11
2039	Santana do Manhuaçu	3158904	11
2040	Santana do Paraíso	3158953	11
2041	Santana do Riacho	3159001	11
2042	Santana dos Montes	3159100	11
2043	Santo Antônio do Amparo	3159902	11
2044	Santo Antônio do Aventureiro	3160009	11
2045	Santo Antônio do Grama	3160108	11
2046	Santo Antônio do Itambé	3160207	11
2047	Santo Antônio do Jacinto	3160306	11
2048	Santo Antônio do Monte	3160405	11
2049	Santo Antônio do Retiro	3160454	11
2050	Santo Antônio do Rio Abaixo	3160504	11
2051	Santo Hipólito	3160603	11
2052	Santos Dumont	3160702	11
2053	São Bento Abade	3160801	11
2054	São Brás do Suaçuí	3160900	11
2055	São Domingos das Dores	3160959	11
2056	São Domingos do Prata	3161007	11
2057	São Félix de Minas	3161056	11
2058	São Francisco	3161106	11
2059	São Francisco de Paula	3161205	11
2060	São Francisco de Sales	3161304	11
2061	São Francisco do Glória	3161403	11
2062	São Geraldo	3161502	11
2063	São Geraldo da Piedade	3161601	11
2064	São Geraldo do Baixio	3161650	11
2065	São Gonçalo do Abaeté	3161700	11
2066	São Gonçalo do Pará	3161809	11
2067	São Gonçalo do Rio Abaixo	3161908	11
2068	São Gonçalo do Rio Preto	3125507	11
2069	São Gonçalo do Sapucaí	3162005	11
2070	São Gotardo	3162104	11
2071	São João Batista do Glória	3162203	11
2072	São João da Lagoa	3162252	11
2073	São João da Mata	3162302	11
2074	São João da Ponte	3162401	11
2075	São João das Missões	3162450	11
2076	São João del Rei	3162500	11
2077	São João do Manhuaçu	3162559	11
2078	São João do Manteninha	3162575	11
2079	São João do Oriente	3162609	11
2080	São João do Pacuí	3162658	11
2081	São João do Paraíso	3162708	11
2082	São João Evangelista	3162807	11
2083	São João Nepomuceno	3162906	11
2084	São Joaquim de Bicas	3162922	11
2085	São José da Barra	3162948	11
2086	São José da Lapa	3162955	11
2087	São José da Safira	3163003	11
2088	São José da Varginha	3163102	11
2089	São José do Alegre	3163201	11
2090	São José do Divino	3163300	11
2091	São José do Goiabal	3163409	11
2092	São José do Jacuri	3163508	11
2093	São José do Mantimento	3163607	11
2094	São Lourenço	3163706	11
2095	São Miguel do Anta	3163805	11
2096	São Pedro da União	3163904	11
2097	São Pedro do Suaçuí	3164100	11
2098	São Pedro dos Ferros	3164001	11
2099	São Romão	3164209	11
2100	São Roque de Minas	3164308	11
2101	São Sebastião da Bela Vista	3164407	11
2102	São Sebastião da Vargem  Alegre	3164431	11
2103	São Sebastião do Anta	3164472	11
2104	São Sebastião do Maranhão	3164506	11
2105	São Sebastião do Oeste	3164605	11
2106	São Sebastião do Paraíso	3164704	11
2107	São Sebastião do Rio Preto	3164803	11
2108	São Sebastião do Rio Verde	3164902	11
2109	São Thomé das Letras	3165206	11
2110	São Tiago	3165008	11
2111	São Tomás de Aquino	3165107	11
2112	São Vicente de Minas	3165305	11
2113	Sapucaí-Mirim	3165404	11
2114	Sardoá	3165503	11
2115	Sarzedo	3165537	11
2116	Sem-Peixe	3165560	11
2117	Senador Amaral	3165578	11
2118	Senador Cortes	3165602	11
2119	Senador Firmino	3165701	11
2120	Senador José Bento	3165800	11
2121	Senador Modestino Gonçalves	3165909	11
2122	Senhora de Oliveira	3166006	11
2123	Senhora do Porto	3166105	11
2124	Senhora dos Remédios	3166204	11
2125	Sericita	3166303	11
2126	Seritinga	3166402	11
2127	Serra Azul de Minas	3166501	11
2128	Serra da Saudade	3166600	11
2129	Serra do Salitre	3166808	11
2130	Serra dos Aimorés	3166709	11
2131	Serrania	3166907	11
2132	Serranópolis de Minas	3166956	11
2133	Serranos	3167004	11
2134	Serro	3167103	11
2135	Sete Lagoas	3167202	11
2136	Setubinha	3165552	11
2137	Silveirânia	3167301	11
2138	Silvianópolis	3167400	11
2139	Simão Pereira	3167509	11
2140	Simonésia	3167608	11
2141	Sobrália	3167707	11
2142	Soledade de Minas	3167806	11
2143	Tabuleiro	3167905	11
2144	Taiobeiras	3168002	11
2145	Taparuba	3168051	11
2146	Tapira	3168101	11
2147	Tapiraí	3168200	11
2148	Taquaraçu de Minas	3168309	11
2149	Tarumirim	3168408	11
2150	Teixeiras	3168507	11
2151	Teófilo Otoni	3168606	11
2152	Timóteo	3168705	11
2153	Tiradentes	3168804	11
2154	Tiros	3168903	11
2155	Tocantins	3169000	11
2156	Tocos do Moji	3169059	11
2157	Toledo	3169109	11
2158	Tombos	3169208	11
2159	Três Corações	3169307	11
2160	Três Marias	3169356	11
2161	Três Pontas	3169406	11
2162	Tumiritinga	3169505	11
2163	Tupaciguara	3169604	11
2164	Turmalina	3169703	11
2165	Turvolândia	3169802	11
2166	Ubá	3169901	11
2167	Ubaí	3170008	11
2168	Ubaporanga	3170057	11
2169	Uberaba	3170107	11
2170	Uberlândia	3170206	11
2171	Umburatiba	3170305	11
2172	Unaí	3170404	11
2173	União de Minas	3170438	11
2174	Uruana de Minas	3170479	11
2175	Urucânia	3170503	11
2176	Urucuia	3170529	11
2177	Vargem Alegre	3170578	11
2178	Vargem Bonita	3170602	11
2179	Vargem Grande do Rio Pardo	3170651	11
2180	Varginha	3170701	11
2181	Varjão de Minas	3170750	11
2182	Várzea da Palma	3170800	11
2183	Varzelândia	3170909	11
2184	Vazante	3171006	11
2185	Verdelândia	3171030	11
2186	Veredinha	3171071	11
2187	Veríssimo	3171105	11
2188	Vermelho Novo	3171154	11
2189	Vespasiano	3171204	11
2190	Viçosa	3171303	11
2191	Vieiras	3171402	11
2192	Virgem da Lapa	3171600	11
2193	Virgínia	3171709	11
2194	Virginópolis	3171808	11
2195	Virgolândia	3171907	11
2196	Visconde do Rio Branco	3172004	11
2197	Volta Grande	3172103	11
2198	Wenceslau Braz	3172202	11
2199	Água Clara	5000203	12
2200	Alcinópolis	5000252	12
2201	Amambai	5000609	12
2202	Anastácio	5000708	12
2203	Anaurilândia	5000807	12
2204	Angélica	5000856	12
2205	Antônio João	5000906	12
2206	Aparecida do Taboado	5001003	12
2207	Aquidauana	5001102	12
2208	Aral Moreira	5001243	12
2209	Bandeirantes	5001508	12
2210	Bataguassu	5001904	12
2211	Batayporã	5002001	12
2212	Bela Vista	5002100	12
2213	Bodoquena	5002159	12
2214	Bonito	5002209	12
2215	Brasilândia	5002308	12
2216	Caarapó	5002407	12
2217	Camapuã	5002605	12
2218	Campo Grande	5002704	12
2219	Caracol	5002803	12
2220	Cassilândia	5002902	12
2221	Chapadão do Sul	5002951	12
2222	Corguinho	5003108	12
2223	Coronel Sapucaia	5003157	12
2224	Corumbá	5003207	12
2225	Costa Rica	5003256	12
2226	Coxim	5003306	12
2227	Deodápolis	5003454	12
2228	Dois Irmãos do Buriti	5003488	12
2229	Douradina	5003504	12
2230	Dourados	5003702	12
2231	Eldorado	5003751	12
2232	Fátima do Sul	5003801	12
2233	Figueirão	5003900	12
2234	Glória de Dourados	5004007	12
2235	Guia Lopes da Laguna	5004106	12
2236	Iguatemi	5004304	12
2237	Inocência	5004403	12
2238	Itaporã	5004502	12
2239	Itaquiraí	5004601	12
2240	Ivinhema	5004700	12
2241	Japorã	5004809	12
2242	Jaraguari	5004908	12
2243	Jardim	5005004	12
2244	Jateí	5005103	12
2245	Juti	5005152	12
2246	Ladário	5005202	12
2247	Laguna Carapã	5005251	12
2248	Maracaju	5005400	12
2249	Miranda	5005608	12
2250	Mundo Novo	5005681	12
2251	Naviraí	5005707	12
2252	Nioaque	5005806	12
2253	Nova Alvorada do Sul	5006002	12
2254	Nova Andradina	5006200	12
2255	Novo Horizonte do Sul	5006259	12
2256	Paraíso das Águas	5006275	12
2257	Paranaíba	5006309	12
2258	Paranhos	5006358	12
2259	Pedro Gomes	5006408	12
2260	Ponta Porã	5006606	12
2261	Porto Murtinho	5006903	12
2262	Ribas do Rio Pardo	5007109	12
2263	Rio Brilhante	5007208	12
2264	Rio Negro	5007307	12
2265	Rio Verde de Mato Grosso	5007406	12
2266	Rochedo	5007505	12
2267	Santa Rita do Pardo	5007554	12
2268	São Gabriel do Oeste	5007695	12
2269	Selvíria	5007802	12
2270	Sete Quedas	5007703	12
2271	Sidrolândia	5007901	12
2272	Sonora	5007935	12
2273	Tacuru	5007950	12
2274	Taquarussu	5007976	12
2275	Terenos	5008008	12
2276	Três Lagoas	5008305	12
2277	Vicentina	5008404	12
2278	Acorizal	5100102	13
2279	Água Boa	5100201	13
2280	Alta Floresta	5100250	13
2281	Alto Araguaia	5100300	13
2282	Alto Boa Vista	5100359	13
2283	Alto Garças	5100409	13
2284	Alto Paraguai	5100508	13
2285	Alto Taquari	5100607	13
2286	Apiacás	5100805	13
2287	Araguaiana	5101001	13
2288	Araguainha	5101209	13
2289	Araputanga	5101258	13
2290	Arenápolis	5101308	13
2291	Aripuanã	5101407	13
2292	Barão de Melgaço	5101605	13
2293	Barra do Bugres	5101704	13
2294	Barra do Garças	5101803	13
2295	Bom Jesus do Araguaia	5101852	13
2296	Brasnorte	5101902	13
2297	Cáceres	5102504	13
2298	Campinápolis	5102603	13
2299	Campo Novo do Parecis	5102637	13
2300	Campo Verde	5102678	13
2301	Campos de Júlio	5102686	13
2302	Canabrava do Norte	5102694	13
2303	Canarana	5102702	13
2304	Carlinda	5102793	13
2305	Castanheira	5102850	13
2306	Chapada dos Guimarães	5103007	13
2307	Cláudia	5103056	13
2308	Cocalinho	5103106	13
2309	Colíder	5103205	13
2310	Colniza	5103254	13
2311	Comodoro	5103304	13
2312	Confresa	5103353	13
2313	Conquista d'Oeste	5103361	13
2314	Cotriguaçu	5103379	13
2315	Cuiabá	5103403	13
2316	Curvelândia	5103437	13
2317	Denise	5103452	13
2318	Diamantino	5103502	13
2319	Dom Aquino	5103601	13
2320	Feliz Natal	5103700	13
2321	Figueirópolis d'Oeste	5103809	13
2322	Gaúcha do Norte	5103858	13
2323	General Carneiro	5103908	13
2324	Glória d'Oeste	5103957	13
2325	Guarantã do Norte	5104104	13
2326	Guiratinga	5104203	13
2327	Indiavaí	5104500	13
2328	Ipiranga do Norte	5104526	13
2329	Itanhangá	5104542	13
2330	Itaúba	5104559	13
2331	Itiquira	5104609	13
2332	Jaciara	5104807	13
2333	Jangada	5104906	13
2334	Jauru	5105002	13
2335	Juara	5105101	13
2336	Juína	5105150	13
2337	Juruena	5105176	13
2338	Juscimeira	5105200	13
2339	Lambari d'Oeste	5105234	13
2340	Lucas do Rio Verde	5105259	13
2341	Luciara	5105309	13
2342	Marcelândia	5105580	13
2343	Matupá	5105606	13
2344	Mirassol d'Oeste	5105622	13
2345	Nobres	5105903	13
2346	Nortelândia	5106000	13
2347	Nossa Senhora do Livramento	5106109	13
2348	Nova Bandeirantes	5106158	13
2349	Nova Brasilândia	5106208	13
2350	Nova Canaã do Norte	5106216	13
2351	Nova Guarita	5108808	13
2352	Nova Lacerda	5106182	13
2353	Nova Marilândia	5108857	13
2354	Nova Maringá	5108907	13
2355	Nova Monte verde	5108956	13
2356	Nova Mutum	5106224	13
2357	Nova Nazaré	5106174	13
2358	Nova Olímpia	5106232	13
2359	Nova Santa Helena	5106190	13
2360	Nova Ubiratã	5106240	13
2361	Nova Xavantina	5106257	13
2362	Novo Horizonte do Norte	5106273	13
2363	Novo Mundo	5106265	13
2364	Novo Santo Antônio	5106315	13
2365	Novo São Joaquim	5106281	13
2366	Paranaíta	5106299	13
2367	Paranatinga	5106307	13
2368	Pedra Preta	5106372	13
2369	Peixoto de Azevedo	5106422	13
2370	Planalto da Serra	5106455	13
2371	Poconé	5106505	13
2372	Pontal do Araguaia	5106653	13
2373	Ponte Branca	5106703	13
2374	Pontes e Lacerda	5106752	13
2375	Porto Alegre do Norte	5106778	13
2376	Porto dos Gaúchos	5106802	13
2377	Porto Esperidião	5106828	13
2378	Porto Estrela	5106851	13
2379	Poxoréu	5107008	13
2380	Primavera do Leste	5107040	13
2381	Querência	5107065	13
2382	Reserva do Cabaçal	5107156	13
2383	Ribeirão Cascalheira	5107180	13
2384	Ribeirãozinho	5107198	13
2385	Rio Branco	5107206	13
2386	Rondolândia	5107578	13
2387	Rondonópolis	5107602	13
2388	Rosário Oeste	5107701	13
2389	Salto do Céu	5107750	13
2390	Santa Carmem	5107248	13
2391	Santa Cruz do Xingu	5107743	13
2392	Santa Rita do Trivelato	5107768	13
2393	Santa Terezinha	5107776	13
2394	Santo Afonso	5107263	13
2395	Santo Antônio do Leste	5107792	13
2396	Santo Antônio do Leverger	5107800	13
2397	São Félix do Araguaia	5107859	13
2398	São José do Povo	5107297	13
2399	São José do Rio Claro	5107305	13
2400	São José do Xingu	5107354	13
2401	São José dos Quatro Marcos	5107107	13
2402	São Pedro da Cipa	5107404	13
2403	Sapezal	5107875	13
2404	Serra Nova Dourada	5107883	13
2405	Sinop	5107909	13
2406	Sorriso	5107925	13
2407	Tabaporã	5107941	13
2408	Tangará da Serra	5107958	13
2409	Tapurah	5108006	13
2410	Terra Nova do Norte	5108055	13
2411	Tesouro	5108105	13
2412	Torixoréu	5108204	13
2413	União do Sul	5108303	13
2414	Vale de São Domingos	5108352	13
2415	Várzea Grande	5108402	13
2416	Vera	5108501	13
2417	Vila Bela da Santíssima Trindade	5105507	13
2418	Vila Rica	5108600	13
2419	Abaetetuba	1500107	14
2420	Abel Figueiredo	1500131	14
2421	Acará	1500206	14
2422	Afuá	1500305	14
2423	Água Azul do Norte	1500347	14
2424	Alenquer	1500404	14
2425	Almeirim	1500503	14
2426	Altamira	1500602	14
2427	Anajás	1500701	14
2428	Ananindeua	1500800	14
2429	Anapu	1500859	14
2430	Augusto Corrêa	1500909	14
2431	Aurora do Pará	1500958	14
2432	Aveiro	1501006	14
2433	Bagre	1501105	14
2434	Baião	1501204	14
2435	Bannach	1501253	14
2436	Barcarena	1501303	14
2437	Belém	1501402	14
2438	Belterra	1501451	14
2439	Benevides	1501501	14
2440	Bom Jesus do Tocantins	1501576	14
2441	Bonito	1501600	14
2442	Bragança	1501709	14
2443	Brasil Novo	1501725	14
2444	Brejo Grande do Araguaia	1501758	14
2445	Breu Branco	1501782	14
2446	Breves	1501808	14
2447	Bujaru	1501907	14
2448	Cachoeira do Arari	1502004	14
2449	Cachoeira do Piriá	1501956	14
2450	Cametá	1502103	14
2451	Canaã dos Carajás	1502152	14
2452	Capanema	1502202	14
2453	Capitão Poço	1502301	14
2454	Castanhal	1502400	14
2455	Chaves	1502509	14
2456	Colares	1502608	14
2457	Conceição do Araguaia	1502707	14
2458	Concórdia do Pará	1502756	14
2459	Cumaru do Norte	1502764	14
2460	Curionópolis	1502772	14
2461	Curralinho	1502806	14
2462	Curuá	1502855	14
2463	Curuçá	1502905	14
2464	Dom Eliseu	1502939	14
2465	Eldorado do Carajás	1502954	14
2466	Faro	1503002	14
2467	Floresta do Araguaia	1503044	14
2468	Garrafão do Norte	1503077	14
2469	Goianésia do Pará	1503093	14
2470	Gurupá	1503101	14
2471	Igarapé-Açu	1503200	14
2472	Igarapé-Miri	1503309	14
2473	Inhangapi	1503408	14
2474	Ipixuna do Pará	1503457	14
2475	Irituia	1503507	14
2476	Itaituba	1503606	14
2477	Itupiranga	1503705	14
2478	Jacareacanga	1503754	14
2479	Jacundá	1503804	14
2480	Juruti	1503903	14
2481	Limoeiro do Ajuru	1504000	14
2482	Mãe do Rio	1504059	14
2483	Magalhães Barata	1504109	14
2484	Marabá	1504208	14
2485	Maracanã	1504307	14
2486	Marapanim	1504406	14
2487	Marituba	1504422	14
2488	Medicilândia	1504455	14
2489	Melgaço	1504505	14
2490	Mocajuba	1504604	14
2491	Moju	1504703	14
2492	Mojuí dos Campos	1504752	14
2493	Monte Alegre	1504802	14
2494	Muaná	1504901	14
2495	Nova Esperança do Piriá	1504950	14
2496	Nova Ipixuna	1504976	14
2497	Nova Timboteua	1505007	14
2498	Novo Progresso	1505031	14
2499	Novo Repartimento	1505064	14
2500	Óbidos	1505106	14
2501	Oeiras do Pará	1505205	14
2502	Oriximiná	1505304	14
2503	Ourém	1505403	14
2504	Ourilândia do Norte	1505437	14
2505	Pacajá	1505486	14
2506	Palestina do Pará	1505494	14
2507	Paragominas	1505502	14
2508	Parauapebas	1505536	14
2509	Pau d'Arco	1505551	14
2510	Peixe-Boi	1505601	14
2511	Piçarra	1505635	14
2512	Placas	1505650	14
2513	Ponta de Pedras	1505700	14
2514	Portel	1505809	14
2515	Porto de Moz	1505908	14
2516	Prainha	1506005	14
2517	Primavera	1506104	14
2518	Quatipuru	1506112	14
2519	Redenção	1506138	14
2520	Rio Maria	1506161	14
2521	Rondon do Pará	1506187	14
2522	Rurópolis	1506195	14
2523	Salinópolis	1506203	14
2524	Salvaterra	1506302	14
2525	Santa Bárbara do Pará	1506351	14
2526	Santa Cruz do Arari	1506401	14
2527	Santa Izabel do Pará	1506500	14
2528	Santa Luzia do Pará	1506559	14
2529	Santa Maria das Barreiras	1506583	14
2530	Santa Maria do Pará	1506609	14
2531	Santana do Araguaia	1506708	14
2532	Santarém	1506807	14
2533	Santarém Novo	1506906	14
2534	Santo Antônio do Tauá	1507003	14
2535	São Caetano de Odivelas	1507102	14
2536	São Domingos do Araguaia	1507151	14
2537	São Domingos do Capim	1507201	14
2538	São Félix do Xingu	1507300	14
2539	São Francisco do Pará	1507409	14
2540	São Geraldo do Araguaia	1507458	14
2541	São João da Ponta	1507466	14
2542	São João de Pirabas	1507474	14
2543	São João do Araguaia	1507508	14
2544	São Miguel do Guamá	1507607	14
2545	São Sebastião da Boa Vista	1507706	14
2546	Sapucaia	1507755	14
2547	Senador José Porfírio	1507805	14
2548	Soure	1507904	14
2549	Tailândia	1507953	14
2550	Terra Alta	1507961	14
2551	Terra Santa	1507979	14
2552	Tomé-Açu	1508001	14
2553	Tracuateua	1508035	14
2554	Trairão	1508050	14
2555	Tucumã	1508084	14
2556	Tucuruí	1508100	14
2557	Ulianópolis	1508126	14
2558	Uruará	1508159	14
2559	Vigia	1508209	14
2560	Viseu	1508308	14
2561	Vitória do Xingu	1508357	14
2562	Xinguara	1508407	14
2563	Água Branca	2500106	15
2564	Aguiar	2500205	15
2565	Alagoa Grande	2500304	15
2566	Alagoa Nova	2500403	15
2567	Alagoinha	2500502	15
2568	Alcantil	2500536	15
2569	Algodão de Jandaíra	2500577	15
2570	Alhandra	2500601	15
2571	Amparo	2500734	15
2572	Aparecida	2500775	15
2573	Araçagi	2500809	15
2574	Arara	2500908	15
2575	Araruna	2501005	15
2576	Areia	2501104	15
2577	Areia de Baraúnas	2501153	15
2578	Areial	2501203	15
2579	Aroeiras	2501302	15
2580	Assunção	2501351	15
2581	Baía da Traição	2501401	15
2582	Bananeiras	2501500	15
2583	Baraúna	2501534	15
2584	Barra de Santa Rosa	2501609	15
2585	Barra de Santana	2501575	15
2586	Barra de São Miguel	2501708	15
2587	Bayeux	2501807	15
2588	Belém	2501906	15
2589	Belém do Brejo do Cruz	2502003	15
2590	Bernardino Batista	2502052	15
2591	Boa Ventura	2502102	15
2592	Boa Vista	2502151	15
2593	Bom Jesus	2502201	15
2594	Bom Sucesso	2502300	15
2595	Bonito de Santa Fé	2502409	15
2596	Boqueirão	2502508	15
2597	Borborema	2502706	15
2598	Brejo do Cruz	2502805	15
2599	Brejo dos Santos	2502904	15
2600	Caaporã	2503001	15
2601	Cabaceiras	2503100	15
2602	Cabedelo	2503209	15
2603	Cachoeira dos Índios	2503308	15
2604	Cacimba de Areia	2503407	15
2605	Cacimba de Dentro	2503506	15
2606	Cacimbas	2503555	15
2607	Caiçara	2503605	15
2608	Cajazeiras	2503704	15
2609	Cajazeirinhas	2503753	15
2610	Caldas Brandão	2503803	15
2611	Camalaú	2503902	15
2612	Campina Grande	2504009	15
2613	Capim	2504033	15
2614	Caraúbas	2504074	15
2615	Carrapateira	2504108	15
2616	Casserengue	2504157	15
2617	Catingueira	2504207	15
2618	Catolé do Rocha	2504306	15
2619	Caturité	2504355	15
2620	Conceição	2504405	15
2621	Condado	2504504	15
2622	Conde	2504603	15
2623	Congo	2504702	15
2624	Coremas	2504801	15
2625	Coxixola	2504850	15
2626	Cruz do Espírito Santo	2504900	15
2627	Cubati	2505006	15
2628	Cuité	2505105	15
2629	Cuité de Mamanguape	2505238	15
2630	Cuitegi	2505204	15
2631	Curral de Cima	2505279	15
2632	Curral Velho	2505303	15
2633	Damião	2505352	15
2634	Desterro	2505402	15
2635	Diamante	2505600	15
2636	Dona Inês	2505709	15
2637	Duas Estradas	2505808	15
2638	Emas	2505907	15
2639	Esperança	2506004	15
2640	Fagundes	2506103	15
2641	Frei Martinho	2506202	15
2642	Gado Bravo	2506251	15
2643	Guarabira	2506301	15
2644	Gurinhém	2506400	15
2645	Gurjão	2506509	15
2646	Ibiara	2506608	15
2647	Igaracy	2502607	15
2648	Imaculada	2506707	15
2649	Ingá	2506806	15
2650	Itabaiana	2506905	15
2651	Itaporanga	2507002	15
2652	Itapororoca	2507101	15
2653	Itatuba	2507200	15
2654	Jacaraú	2507309	15
2655	Jericó	2507408	15
2656	João Pessoa	2507507	15
2657	Joca Claudino	2513653	15
2658	Juarez Távora	2507606	15
2659	Juazeirinho	2507705	15
2660	Junco do Seridó	2507804	15
2661	Juripiranga	2507903	15
2662	Juru	2508000	15
2663	Lagoa	2508109	15
2664	Lagoa de Dentro	2508208	15
2665	Lagoa Seca	2508307	15
2666	Lastro	2508406	15
2667	Livramento	2508505	15
2668	Logradouro	2508554	15
2669	Lucena	2508604	15
2670	Mãe d'Água	2508703	15
2671	Malta	2508802	15
2672	Mamanguape	2508901	15
2673	Manaíra	2509008	15
2674	Marcação	2509057	15
2675	Mari	2509107	15
2676	Marizópolis	2509156	15
2677	Massaranduba	2509206	15
2678	Mataraca	2509305	15
2679	Matinhas	2509339	15
2680	Mato Grosso	2509370	15
2681	Maturéia	2509396	15
2682	Mogeiro	2509404	15
2683	Montadas	2509503	15
2684	Monte Horebe	2509602	15
2685	Monteiro	2509701	15
2686	Mulungu	2509800	15
2687	Natuba	2509909	15
2688	Nazarezinho	2510006	15
2689	Nova Floresta	2510105	15
2690	Nova Olinda	2510204	15
2691	Nova Palmeira	2510303	15
2692	Olho d'Água	2510402	15
2693	Olivedos	2510501	15
2694	Ouro Velho	2510600	15
2695	Parari	2510659	15
2696	Passagem	2510709	15
2697	Patos	2510808	15
2698	Paulista	2510907	15
2699	Pedra Branca	2511004	15
2700	Pedra Lavrada	2511103	15
2701	Pedras de Fogo	2511202	15
2702	Pedro Régis	2512721	15
2703	Piancó	2511301	15
2704	Picuí	2511400	15
2705	Pilar	2511509	15
2706	Pilões	2511608	15
2707	Pilõezinhos	2511707	15
2708	Pirpirituba	2511806	15
2709	Pitimbu	2511905	15
2710	Pocinhos	2512002	15
2711	Poço Dantas	2512036	15
2712	Poço de José de Moura	2512077	15
2713	Pombal	2512101	15
2714	Prata	2512200	15
2715	Princesa Isabel	2512309	15
2716	Puxinanã	2512408	15
2717	Queimadas	2512507	15
2718	Quixaba	2512606	15
2719	Remígio	2512705	15
2720	Riachão	2512747	15
2721	Riachão do Bacamarte	2512754	15
2722	Riachão do Poço	2512762	15
2723	Riacho de Santo Antônio	2512788	15
2724	Riacho dos Cavalos	2512804	15
2725	Rio Tinto	2512903	15
2726	Salgadinho	2513000	15
2727	Salgado de São Félix	2513109	15
2728	Santa Cecília	2513158	15
2729	Santa Cruz	2513208	15
2730	Santa Helena	2513307	15
2731	Santa Inês	2513356	15
2732	Santa Luzia	2513406	15
2733	Santa Rita	2513703	15
2734	Santa Teresinha	2513802	15
2735	Santana de Mangueira	2513505	15
2736	Santana dos Garrotes	2513604	15
2737	Santo André	2513851	15
2738	São Bentinho	2513927	15
2739	São Bento	2513901	15
2740	São Domingos	2513968	15
2741	São Domingos do Cariri	2513943	15
2742	São Francisco	2513984	15
2743	São João do Cariri	2514008	15
2744	São João do Rio do Peixe	2500700	15
2745	São João do Tigre	2514107	15
2746	São José da Lagoa Tapada	2514206	15
2747	São José de Caiana	2514305	15
2748	São José de Espinharas	2514404	15
2749	São José de Piranhas	2514503	15
2750	São José de Princesa	2514552	15
2751	São José do Bonfim	2514602	15
2752	São José do Brejo do Cruz	2514651	15
2753	São José do Sabugi	2514701	15
2754	São José dos Cordeiros	2514800	15
2755	São José dos Ramos	2514453	15
2756	São Mamede	2514909	15
2757	São Miguel de Taipu	2515005	15
2758	São Sebastião de Lagoa de  Roça	2515104	15
2759	São Sebastião do Umbuzeiro	2515203	15
2760	São Vicente do Seridó	2515401	15
2761	Sapé	2515302	15
2762	Serra Branca	2515500	15
2763	Serra da Raiz	2515609	15
2764	Serra Grande	2515708	15
2765	Serra Redonda	2515807	15
2766	Serraria	2515906	15
2767	Sertãozinho	2515930	15
2768	Sobrado	2515971	15
2769	Solânea	2516003	15
2770	Soledade	2516102	15
2771	Sossêgo	2516151	15
2772	Sousa	2516201	15
2773	Sumé	2516300	15
2774	Tacima	2516409	15
2775	Taperoá	2516508	15
2776	Tavares	2516607	15
2777	Teixeira	2516706	15
2778	Tenório	2516755	15
2779	Triunfo	2516805	15
2780	Uiraúna	2516904	15
2781	Umbuzeiro	2517001	15
2782	Várzea	2517100	15
2783	Vieirópolis	2517209	15
2784	Vista Serrana	2505501	15
2785	Zabelê	2517407	15
2786	Abreu e Lima	2600054	16
2787	Afogados da Ingazeira	2600104	16
2788	Afrânio	2600203	16
2789	Agrestina	2600302	16
2790	Água Preta	2600401	16
2791	Águas Belas	2600500	16
2792	Alagoinha	2600609	16
2793	Aliança	2600708	16
2794	Altinho	2600807	16
2795	Amaraji	2600906	16
2796	Angelim	2601003	16
2797	Araçoiaba	2601052	16
2798	Araripina	2601102	16
2799	Arcoverde	2601201	16
2800	Barra de Guabiraba	2601300	16
2801	Barreiros	2601409	16
2802	Belém de Maria	2601508	16
2803	Belém do São Francisco	2601607	16
2804	Belo Jardim	2601706	16
2805	Betânia	2601805	16
2806	Bezerros	2601904	16
2807	Bodocó	2602001	16
2808	Bom Conselho	2602100	16
2809	Bom Jardim	2602209	16
2810	Bonito	2602308	16
2811	Brejão	2602407	16
2812	Brejinho	2602506	16
2813	Brejo da Madre de Deus	2602605	16
2814	Buenos Aires	2602704	16
2815	Buíque	2602803	16
2816	Cabo de Santo Agostinho	2602902	16
2817	Cabrobó	2603009	16
2818	Cachoeirinha	2603108	16
2819	Caetés	2603207	16
2820	Calçado	2603306	16
2821	Calumbi	2603405	16
2822	Camaragibe	2603454	16
2823	Camocim de São Félix	2603504	16
2824	Camutanga	2603603	16
2825	Canhotinho	2603702	16
2826	Capoeiras	2603801	16
2827	Carnaíba	2603900	16
2828	Carnaubeira da Penha	2603926	16
2829	Carpina	2604007	16
2830	Caruaru	2604106	16
2831	Casinhas	2604155	16
2832	Catende	2604205	16
2833	Cedro	2604304	16
2834	Chã de Alegria	2604403	16
2835	Chã Grande	2604502	16
2836	Condado	2604601	16
2837	Correntes	2604700	16
2838	Cortês	2604809	16
2839	Cumaru	2604908	16
2840	Cupira	2605004	16
2841	Custódia	2605103	16
2842	Dormentes	2605152	16
2843	Escada	2605202	16
2844	Exu	2605301	16
2845	Feira Nova	2605400	16
2846	Fernando de Noronha	2605459	16
2847	Ferreiros	2605509	16
2848	Flores	2605608	16
2849	Floresta	2605707	16
2850	Frei Miguelinho	2605806	16
2851	Gameleira	2605905	16
2852	Garanhuns	2606002	16
2853	Glória do Goitá	2606101	16
2854	Goiana	2606200	16
2855	Granito	2606309	16
2856	Gravatá	2606408	16
2857	Iati	2606507	16
2858	Ibimirim	2606606	16
2859	Ibirajuba	2606705	16
2860	Igarassu	2606804	16
2861	Iguaracy	2606903	16
2862	Ilha de Itamaracá	2607604	16
2863	Inajá	2607000	16
2864	Ingazeira	2607109	16
2865	Ipojuca	2607208	16
2866	Ipubi	2607307	16
2867	Itacuruba	2607406	16
2868	Itaíba	2607505	16
2869	Itambé	2607653	16
2870	Itapetim	2607703	16
2871	Itapissuma	2607752	16
2872	Itaquitinga	2607802	16
2873	Jaboatão dos Guararapes	2607901	16
2874	Jaqueira	2607950	16
2875	Jataúba	2608008	16
2876	Jatobá	2608057	16
2877	João Alfredo	2608107	16
2878	Joaquim Nabuco	2608206	16
2879	Jucati	2608255	16
2880	Jupi	2608305	16
2881	Jurema	2608404	16
2882	Lagoa de Itaenga	2608503	16
2883	Lagoa do Carro	2608453	16
2884	Lagoa do Ouro	2608602	16
2885	Lagoa dos Gatos	2608701	16
2886	Lagoa Grande	2608750	16
2887	Lajedo	2608800	16
2888	Limoeiro	2608909	16
2889	Macaparana	2609006	16
2890	Machados	2609105	16
2891	Manari	2609154	16
2892	Maraial	2609204	16
2893	Mirandiba	2609303	16
2894	Moreilândia	2614303	16
2895	Moreno	2609402	16
2896	Nazaré da Mata	2609501	16
2897	Olinda	2609600	16
2898	Orobó	2609709	16
2899	Orocó	2609808	16
2900	Ouricuri	2609907	16
2901	Palmares	2610004	16
2902	Palmeirina	2610103	16
2903	Panelas	2610202	16
2904	Paranatama	2610301	16
2905	Parnamirim	2610400	16
2906	Passira	2610509	16
2907	Paudalho	2610608	16
2908	Paulista	2610707	16
2909	Pedra	2610806	16
2910	Pesqueira	2610905	16
2911	Petrolândia	2611002	16
2912	Petrolina	2611101	16
2913	Poção	2611200	16
2914	Pombos	2611309	16
2915	Primavera	2611408	16
2916	Quipapá	2611507	16
2917	Quixaba	2611533	16
2918	Recife	2611606	16
2919	Riacho das Almas	2611705	16
2920	Ribeirão	2611804	16
2921	Rio Formoso	2611903	16
2922	Sairé	2612000	16
2923	Salgadinho	2612109	16
2924	Salgueiro	2612208	16
2925	Saloá	2612307	16
2926	Sanharó	2612406	16
2927	Santa Cruz	2612455	16
2928	Santa Cruz da Baixa Verde	2612471	16
2929	Santa Cruz do Capibaribe	2612505	16
2930	Santa Filomena	2612554	16
2931	Santa Maria da Boa Vista	2612604	16
2932	Santa Maria do Cambucá	2612703	16
2933	Santa Terezinha	2612802	16
2934	São Benedito do Sul	2612901	16
2935	São Bento do Una	2613008	16
2936	São Caitano	2613107	16
2937	São João	2613206	16
2938	São Joaquim do Monte	2613305	16
2939	São José da Coroa Grande	2613404	16
2940	São José do Belmonte	2613503	16
2941	São José do Egito	2613602	16
2942	São Lourenço da Mata	2613701	16
2943	São Vicente Ferrer	2613800	16
2944	Serra Talhada	2613909	16
2945	Serrita	2614006	16
2946	Sertânia	2614105	16
2947	Sirinhaém	2614204	16
2948	Solidão	2614402	16
2949	Surubim	2614501	16
2950	Tabira	2614600	16
2951	Tacaimbó	2614709	16
2952	Tacaratu	2614808	16
2953	Tamandaré	2614857	16
2954	Taquaritinga do Norte	2615003	16
2955	Terezinha	2615102	16
2956	Terra Nova	2615201	16
2957	Timbaúba	2615300	16
2958	Toritama	2615409	16
2959	Tracunhaém	2615508	16
2960	Trindade	2615607	16
2961	Triunfo	2615706	16
2962	Tupanatinga	2615805	16
2963	Tuparetama	2615904	16
2964	Venturosa	2616001	16
2965	Verdejante	2616100	16
2966	Vertente do Lério	2616183	16
2967	Vertentes	2616209	16
2968	Vicência	2616308	16
2969	Vitória de Santo Antão	2616407	16
2970	Xexéu	2616506	16
2971	Acauã	2200053	17
2972	Agricolândia	2200103	17
2973	Água Branca	2200202	17
2974	Alagoinha do Piauí	2200251	17
2975	Alegrete do Piauí	2200277	17
2976	Alto Longá	2200301	17
2977	Altos	2200400	17
2978	Alvorada do Gurguéia	2200459	17
2979	Amarante	2200509	17
2980	Angical do Piauí	2200608	17
2981	Anísio de Abreu	2200707	17
2982	Antônio Almeida	2200806	17
2983	Aroazes	2200905	17
2984	Aroeiras do Itaim	2200954	17
2985	Arraial	2201002	17
2986	Assunção do Piauí	2201051	17
2987	Avelino Lopes	2201101	17
2988	Baixa Grande do Ribeiro	2201150	17
2989	Barra d'Alcântara	2201176	17
2990	Barras	2201200	17
2991	Barreiras do Piauí	2201309	17
2992	Barro Duro	2201408	17
2993	Batalha	2201507	17
2994	Bela Vista do Piauí	2201556	17
2995	Belém do Piauí	2201572	17
2996	Beneditinos	2201606	17
2997	Bertolínia	2201705	17
2998	Betânia do Piauí	2201739	17
2999	Boa Hora	2201770	17
3000	Bocaina	2201804	17
3001	Bom Jesus	2201903	17
3002	Bom Princípio do Piauí	2201919	17
3003	Bonfim do Piauí	2201929	17
3004	Boqueirão do Piauí	2201945	17
3005	Brasileira	2201960	17
3006	Brejo do Piauí	2201988	17
3007	Buriti dos Lopes	2202000	17
3008	Buriti dos Montes	2202026	17
3009	Cabeceiras do Piauí	2202059	17
3010	Cajazeiras do Piauí	2202075	17
3011	Cajueiro da Praia	2202083	17
3012	Caldeirão Grande do Piauí	2202091	17
3013	Campinas do Piauí	2202109	17
3014	Campo Alegre do Fidalgo	2202117	17
3015	Campo Grande do Piauí	2202133	17
3016	Campo Largo do Piauí	2202174	17
3017	Campo Maior	2202208	17
3018	Canavieira	2202251	17
3019	Canto do Buriti	2202307	17
3020	Capitão de Campos	2202406	17
3021	Capitão Gervásio Oliveira	2202455	17
3022	Caracol	2202505	17
3023	Caraúbas do Piauí	2202539	17
3024	Caridade do Piauí	2202554	17
3025	Castelo do Piauí	2202604	17
3026	Caxingó	2202653	17
3027	Cocal	2202703	17
3028	Cocal de Telha	2202711	17
3029	Cocal dos Alves	2202729	17
3030	Coivaras	2202737	17
3031	Colônia do Gurguéia	2202752	17
3032	Colônia do Piauí	2202778	17
3033	Conceição do Canindé	2202802	17
3034	Coronel José Dias	2202851	17
3035	Corrente	2202901	17
3036	Cristalândia do Piauí	2203008	17
3037	Cristino Castro	2203107	17
3038	Curimatá	2203206	17
3039	Currais	2203230	17
3040	Curral Novo do Piauí	2203271	17
3041	Curralinhos	2203255	17
3042	Demerval Lobão	2203305	17
3043	Dirceu Arcoverde	2203354	17
3044	Dom Expedito Lopes	2203404	17
3045	Dom Inocêncio	2203453	17
3046	Domingos Mourão	2203420	17
3047	Elesbão Veloso	2203503	17
3048	Eliseu Martins	2203602	17
3049	Esperantina	2203701	17
3050	Fartura do Piauí	2203750	17
3051	Flores do Piauí	2203800	17
3052	Floresta do Piauí	2203859	17
3053	Floriano	2203909	17
3054	Francinópolis	2204006	17
3055	Francisco Ayres	2204105	17
3056	Francisco Macedo	2204154	17
3057	Francisco Santos	2204204	17
3058	Fronteiras	2204303	17
3059	Geminiano	2204352	17
3060	Gilbués	2204402	17
3061	Guadalupe	2204501	17
3062	Guaribas	2204550	17
3063	Hugo Napoleão	2204600	17
3064	Ilha Grande	2204659	17
3065	Inhuma	2204709	17
3066	Ipiranga do Piauí	2204808	17
3067	Isaías Coelho	2204907	17
3068	Itainópolis	2205003	17
3069	Itaueira	2205102	17
3070	Jacobina do Piauí	2205151	17
3071	Jaicós	2205201	17
3072	Jardim do Mulato	2205250	17
3073	Jatobá do Piauí	2205276	17
3074	Jerumenha	2205300	17
3075	João Costa	2205359	17
3076	Joaquim Pires	2205409	17
3077	Joca Marques	2205458	17
3078	José de Freitas	2205508	17
3079	Juazeiro do Piauí	2205516	17
3080	Júlio Borges	2205524	17
3081	Jurema	2205532	17
3082	Lagoa Alegre	2205557	17
3083	Lagoa de São Francisco	2205573	17
3084	Lagoa do Barro do Piauí	2205565	17
3085	Lagoa do Piauí	2205581	17
3086	Lagoa do Sítio	2205599	17
3087	Lagoinha do Piauí	2205540	17
3088	Landri Sales	2205607	17
3089	Luís Correia	2205706	17
3090	Luzilândia	2205805	17
3091	Madeiro	2205854	17
3092	Manoel Emídio	2205904	17
3093	Marcolândia	2205953	17
3094	Marcos Parente	2206001	17
3095	Massapê do Piauí	2206050	17
3096	Matias Olímpio	2206100	17
3097	Miguel Alves	2206209	17
3098	Miguel Leão	2206308	17
3099	Milton Brandão	2206357	17
3100	Monsenhor Gil	2206407	17
3101	Monsenhor Hipólito	2206506	17
3102	Monte Alegre do Piauí	2206605	17
3103	Morro Cabeça no Tempo	2206654	17
3104	Morro do Chapéu do Piauí	2206670	17
3105	Murici dos Portelas	2206696	17
3106	Nazaré do Piauí	2206704	17
3107	Nazária	2206720	17
3108	Nossa Senhora de Nazaré	2206753	17
3109	Nossa Senhora dos Remédios	2206803	17
3110	Nova Santa Rita	2207959	17
3111	Novo Oriente do Piauí	2206902	17
3112	Novo Santo Antônio	2206951	17
3113	Oeiras	2207009	17
3114	Olho d'Água do Piauí	2207108	17
3115	Padre Marcos	2207207	17
3116	Paes Landim	2207306	17
3117	Pajeú do Piauí	2207355	17
3118	Palmeira do Piauí	2207405	17
3119	Palmeirais	2207504	17
3120	Paquetá	2207553	17
3121	Parnaguá	2207603	17
3122	Parnaíba	2207702	17
3123	Passagem Franca do Piauí	2207751	17
3124	Patos do Piauí	2207777	17
3125	Pau d'Arco do Piauí	2207793	17
3126	Paulistana	2207801	17
3127	Pavussu	2207850	17
3128	Pedro II	2207900	17
3129	Pedro Laurentino	2207934	17
3130	Picos	2208007	17
3131	Pimenteiras	2208106	17
3132	Pio IX	2208205	17
3133	Piracuruca	2208304	17
3134	Piripiri	2208403	17
3135	Porto	2208502	17
3136	Porto Alegre do Piauí	2208551	17
3137	Prata do Piauí	2208601	17
3138	Queimada Nova	2208650	17
3139	Redenção do Gurguéia	2208700	17
3140	Regeneração	2208809	17
3141	Riacho Frio	2208858	17
3142	Ribeira do Piauí	2208874	17
3143	Ribeiro Gonçalves	2208908	17
3144	Rio Grande do Piauí	2209005	17
3145	Santa Cruz do Piauí	2209104	17
3146	Santa Cruz dos Milagres	2209153	17
3147	Santa Filomena	2209203	17
3148	Santa Luz	2209302	17
3149	Santa Rosa do Piauí	2209377	17
3150	Santana do Piauí	2209351	17
3151	Santo Antônio de Lisboa	2209401	17
3152	Santo Antônio dos Milagres	2209450	17
3153	Santo Inácio do Piauí	2209500	17
3154	São Braz do Piauí	2209559	17
3155	São Félix do Piauí	2209609	17
3156	São Francisco de Assis do  Piauí	2209658	17
3157	São Francisco do Piauí	2209708	17
3158	São Gonçalo do Gurguéia	2209757	17
3159	São Gonçalo do Piauí	2209807	17
3160	São João da Canabrava	2209856	17
3161	São João da Fronteira	2209872	17
3162	São João da Serra	2209906	17
3163	São João da Varjota	2209955	17
3164	São João do Arraial	2209971	17
3165	São João do Piauí	2210003	17
3166	São José do Divino	2210052	17
3167	São José do Peixe	2210102	17
3168	São José do Piauí	2210201	17
3169	São Julião	2210300	17
3170	São Lourenço do Piauí	2210359	17
3171	São Luis do Piauí	2210375	17
3172	São Miguel da Baixa Grande	2210383	17
3173	São Miguel do Fidalgo	2210391	17
3174	São Miguel do Tapuio	2210409	17
3175	São Pedro do Piauí	2210508	17
3176	São Raimundo Nonato	2210607	17
3177	Sebastião Barros	2210623	17
3178	Sebastião Leal	2210631	17
3179	Sigefredo Pacheco	2210656	17
3180	Simões	2210706	17
3181	Simplício Mendes	2210805	17
3182	Socorro do Piauí	2210904	17
3183	Sussuapara	2210938	17
3184	Tamboril do Piauí	2210953	17
3185	Tanque do Piauí	2210979	17
3186	Teresina	2211001	17
3187	União	2211100	17
3188	Uruçuí	2211209	17
3189	Valença do Piauí	2211308	17
3190	Várzea Branca	2211357	17
3191	Várzea Grande	2211407	17
3192	Vera Mendes	2211506	17
3193	Vila Nova do Piauí	2211605	17
3194	Wall Ferraz	2211704	17
3195	Abatiá	4100103	18
3196	Adrianópolis	4100202	18
3197	Agudos do Sul	4100301	18
3198	Almirante Tamandaré	4100400	18
3199	Altamira do Paraná	4100459	18
3200	Alto Paraíso	4128625	18
3201	Alto Paraná	4100608	18
3202	Alto Piquiri	4100707	18
3203	Altônia	4100509	18
3204	Alvorada do Sul	4100806	18
3205	Amaporã	4100905	18
3206	Ampére	4101002	18
3207	Anahy	4101051	18
3208	Andirá	4101101	18
3209	Ângulo	4101150	18
3210	Antonina	4101200	18
3211	Antônio Olinto	4101309	18
3212	Apucarana	4101408	18
3213	Arapongas	4101507	18
3214	Arapoti	4101606	18
3215	Arapuã	4101655	18
3216	Araruna	4101705	18
3217	Araucária	4101804	18
3218	Ariranha do Ivaí	4101853	18
3219	Assaí	4101903	18
3220	Assis Chateaubriand	4102000	18
3221	Astorga	4102109	18
3222	Atalaia	4102208	18
3223	Balsa Nova	4102307	18
3224	Bandeirantes	4102406	18
3225	Barbosa Ferraz	4102505	18
3226	Barra do Jacaré	4102703	18
3227	Barracão	4102604	18
3228	Bela Vista da Caroba	4102752	18
3229	Bela Vista do Paraíso	4102802	18
3230	Bituruna	4102901	18
3231	Boa Esperança	4103008	18
3232	Boa Esperança do Iguaçu	4103024	18
3233	Boa Ventura de São Roque	4103040	18
3234	Boa Vista da Aparecida	4103057	18
3235	Bocaiúva do Sul	4103107	18
3236	Bom Jesus do Sul	4103156	18
3237	Bom Sucesso	4103206	18
3238	Bom Sucesso do Sul	4103222	18
3239	Borrazópolis	4103305	18
3240	Braganey	4103354	18
3241	Brasilândia do Sul	4103370	18
3242	Cafeara	4103404	18
3243	Cafelândia	4103453	18
3244	Cafezal do Sul	4103479	18
3245	Califórnia	4103503	18
3246	Cambará	4103602	18
3247	Cambé	4103701	18
3248	Cambira	4103800	18
3249	Campina da Lagoa	4103909	18
3250	Campina do Simão	4103958	18
3251	Campina Grande do Sul	4104006	18
3252	Campo Bonito	4104055	18
3253	Campo do Tenente	4104105	18
3254	Campo Largo	4104204	18
3255	Campo Magro	4104253	18
3256	Campo Mourão	4104303	18
3257	Cândido de Abreu	4104402	18
3258	Candói	4104428	18
3259	Cantagalo	4104451	18
3260	Capanema	4104501	18
3261	Capitão Leônidas Marques	4104600	18
3262	Carambeí	4104659	18
3263	Carlópolis	4104709	18
3264	Cascavel	4104808	18
3265	Castro	4104907	18
3266	Catanduvas	4105003	18
3267	Centenário do Sul	4105102	18
3268	Cerro Azul	4105201	18
3269	Céu Azul	4105300	18
3270	Chopinzinho	4105409	18
3271	Cianorte	4105508	18
3272	Cidade Gaúcha	4105607	18
3273	Clevelândia	4105706	18
3274	Colombo	4105805	18
3275	Colorado	4105904	18
3276	Congonhinhas	4106001	18
3277	Conselheiro Mairinck	4106100	18
3278	Contenda	4106209	18
3279	Corbélia	4106308	18
3280	Cornélio Procópio	4106407	18
3281	Coronel Domingos Soares	4106456	18
3282	Coronel Vivida	4106506	18
3283	Corumbataí do Sul	4106555	18
3284	Cruz Machado	4106803	18
3285	Cruzeiro do Iguaçu	4106571	18
3286	Cruzeiro do Oeste	4106605	18
3287	Cruzeiro do Sul	4106704	18
3288	Cruzmaltina	4106852	18
3289	Curitiba	4106902	18
3290	Curiúva	4107009	18
3291	Diamante do Norte	4107108	18
3292	Diamante do Sul	4107124	18
3293	Diamante d'Oeste	4107157	18
3294	Dois Vizinhos	4107207	18
3295	Douradina	4107256	18
3296	Doutor Camargo	4107306	18
3297	Doutor Ulysses	4128633	18
3298	Enéas Marques	4107405	18
3299	Engenheiro Beltrão	4107504	18
3300	Entre Rios do Oeste	4107538	18
3301	Esperança Nova	4107520	18
3302	Espigão Alto do Iguaçu	4107546	18
3303	Farol	4107553	18
3304	Faxinal	4107603	18
3305	Fazenda Rio Grande	4107652	18
3306	Fênix	4107702	18
3307	Fernandes Pinheiro	4107736	18
3308	Figueira	4107751	18
3309	Flor da Serra do Sul	4107850	18
3310	Floraí	4107801	18
3311	Floresta	4107900	18
3312	Florestópolis	4108007	18
3313	Flórida	4108106	18
3314	Formosa do Oeste	4108205	18
3315	Foz do Iguaçu	4108304	18
3316	Foz do Jordão	4108452	18
3317	Francisco Alves	4108320	18
3318	Francisco Beltrão	4108403	18
3319	General Carneiro	4108502	18
3320	Godoy Moreira	4108551	18
3321	Goioerê	4108601	18
3322	Goioxim	4108650	18
3323	Grandes Rios	4108700	18
3324	Guaíra	4108809	18
3325	Guairaçá	4108908	18
3326	Guamiranga	4108957	18
3327	Guapirama	4109005	18
3328	Guaporema	4109104	18
3329	Guaraci	4109203	18
3330	Guaraniaçu	4109302	18
3331	Guarapuava	4109401	18
3332	Guaraqueçaba	4109500	18
3333	Guaratuba	4109609	18
3334	Honório Serpa	4109658	18
3335	Ibaiti	4109708	18
3336	Ibema	4109757	18
3337	Ibiporã	4109807	18
3338	Icaraíma	4109906	18
3339	Iguaraçu	4110003	18
3340	Iguatu	4110052	18
3341	Imbaú	4110078	18
3342	Imbituva	4110102	18
3343	Inácio Martins	4110201	18
3344	Inajá	4110300	18
3345	Indianópolis	4110409	18
3346	Ipiranga	4110508	18
3347	Iporã	4110607	18
3348	Iracema do Oeste	4110656	18
3349	Irati	4110706	18
3350	Iretama	4110805	18
3351	Itaguajé	4110904	18
3352	Itaipulândia	4110953	18
3353	Itambaracá	4111001	18
3354	Itambé	4111100	18
3355	Itapejara d'Oeste	4111209	18
3356	Itaperuçu	4111258	18
3357	Itaúna do Sul	4111308	18
3358	Ivaí	4111407	18
3359	Ivaiporã	4111506	18
3360	Ivaté	4111555	18
3361	Ivatuba	4111605	18
3362	Jaboti	4111704	18
3363	Jacarezinho	4111803	18
3364	Jaguapitã	4111902	18
3365	Jaguariaíva	4112009	18
3366	Jandaia do Sul	4112108	18
3367	Janiópolis	4112207	18
3368	Japira	4112306	18
3369	Japurá	4112405	18
3370	Jardim Alegre	4112504	18
3371	Jardim Olinda	4112603	18
3372	Jataizinho	4112702	18
3373	Jesuítas	4112751	18
3374	Joaquim Távora	4112801	18
3375	Jundiaí do Sul	4112900	18
3376	Juranda	4112959	18
3377	Jussara	4113007	18
3378	Kaloré	4113106	18
3379	Lapa	4113205	18
3380	Laranjal	4113254	18
3381	Laranjeiras do Sul	4113304	18
3382	Leópolis	4113403	18
3383	Lidianópolis	4113429	18
3384	Lindoeste	4113452	18
3385	Loanda	4113502	18
3386	Lobato	4113601	18
3387	Londrina	4113700	18
3388	Luiziana	4113734	18
3389	Lunardelli	4113759	18
3390	Lupionópolis	4113809	18
3391	Mallet	4113908	18
3392	Mamborê	4114005	18
3393	Mandaguaçu	4114104	18
3394	Mandaguari	4114203	18
3395	Mandirituba	4114302	18
3396	Manfrinópolis	4114351	18
3397	Mangueirinha	4114401	18
3398	Manoel Ribas	4114500	18
3399	Marechal Cândido Rondon	4114609	18
3400	Maria Helena	4114708	18
3401	Marialva	4114807	18
3402	Marilândia do Sul	4114906	18
3403	Marilena	4115002	18
3404	Mariluz	4115101	18
3405	Maringá	4115200	18
3406	Mariópolis	4115309	18
3407	Maripá	4115358	18
3408	Marmeleiro	4115408	18
3409	Marquinho	4115457	18
3410	Marumbi	4115507	18
3411	Matelândia	4115606	18
3412	Matinhos	4115705	18
3413	Mato Rico	4115739	18
3414	Mauá da Serra	4115754	18
3415	Medianeira	4115804	18
3416	Mercedes	4115853	18
3417	Mirador	4115903	18
3418	Miraselva	4116000	18
3419	Missal	4116059	18
3420	Moreira Sales	4116109	18
3421	Morretes	4116208	18
3422	Munhoz de Melo	4116307	18
3423	Nossa Senhora das Graças	4116406	18
3424	Nova Aliança do Ivaí	4116505	18
3425	Nova América da Colina	4116604	18
3426	Nova Aurora	4116703	18
3427	Nova Cantu	4116802	18
3428	Nova Esperança	4116901	18
3429	Nova Esperança do Sudoeste	4116950	18
3430	Nova Fátima	4117008	18
3431	Nova Laranjeiras	4117057	18
3432	Nova Londrina	4117107	18
3433	Nova Olímpia	4117206	18
3434	Nova Prata do Iguaçu	4117255	18
3435	Nova Santa Bárbara	4117214	18
3436	Nova Santa Rosa	4117222	18
3437	Nova Tebas	4117271	18
3438	Novo Itacolomi	4117297	18
3439	Ortigueira	4117305	18
3440	Ourizona	4117404	18
3441	Ouro Verde do Oeste	4117453	18
3442	Paiçandu	4117503	18
3443	Palmas	4117602	18
3444	Palmeira	4117701	18
3445	Palmital	4117800	18
3446	Palotina	4117909	18
3447	Paraíso do Norte	4118006	18
3448	Paranacity	4118105	18
3449	Paranaguá	4118204	18
3450	Paranapoema	4118303	18
3451	Paranavaí	4118402	18
3452	Pato Bragado	4118451	18
3453	Pato Branco	4118501	18
3454	Paula Freitas	4118600	18
3455	Paulo Frontin	4118709	18
3456	Peabiru	4118808	18
3457	Perobal	4118857	18
3458	Pérola	4118907	18
3459	Pérola d'Oeste	4119004	18
3460	Piên	4119103	18
3461	Pinhais	4119152	18
3462	Pinhal de São Bento	4119251	18
3463	Pinhalão	4119202	18
3464	Pinhão	4119301	18
3465	Piraí do Sul	4119400	18
3466	Piraquara	4119509	18
3467	Pitanga	4119608	18
3468	Pitangueiras	4119657	18
3469	Planaltina do Paraná	4119707	18
3470	Planalto	4119806	18
3471	Ponta Grossa	4119905	18
3472	Pontal do Paraná	4119954	18
3473	Porecatu	4120002	18
3474	Porto Amazonas	4120101	18
3475	Porto Barreiro	4120150	18
3476	Porto Rico	4120200	18
3477	Porto Vitória	4120309	18
3478	Prado Ferreira	4120333	18
3479	Pranchita	4120358	18
3480	Presidente Castelo Branco	4120408	18
3481	Primeiro de Maio	4120507	18
3482	Prudentópolis	4120606	18
3483	Quarto Centenário	4120655	18
3484	Quatiguá	4120705	18
3485	Quatro Barras	4120804	18
3486	Quatro Pontes	4120853	18
3487	Quedas do Iguaçu	4120903	18
3488	Querência do Norte	4121000	18
3489	Quinta do Sol	4121109	18
3490	Quitandinha	4121208	18
3491	Ramilândia	4121257	18
3492	Rancho Alegre	4121307	18
3493	Rancho Alegre d'Oeste	4121356	18
3494	Realeza	4121406	18
3495	Rebouças	4121505	18
3496	Renascença	4121604	18
3497	Reserva	4121703	18
3498	Reserva do Iguaçu	4121752	18
3499	Ribeirão Claro	4121802	18
3500	Ribeirão do Pinhal	4121901	18
3501	Rio Azul	4122008	18
3502	Rio Bom	4122107	18
3503	Rio Bonito do Iguaçu	4122156	18
3504	Rio Branco do Ivaí	4122172	18
3505	Rio Branco do Sul	4122206	18
3506	Rio Negro	4122305	18
3507	Rolândia	4122404	18
3508	Roncador	4122503	18
3509	Rondon	4122602	18
3510	Rosário do Ivaí	4122651	18
3511	Sabáudia	4122701	18
3512	Salgado Filho	4122800	18
3513	Salto do Itararé	4122909	18
3514	Salto do Lontra	4123006	18
3515	Santa Amélia	4123105	18
3516	Santa Cecília do Pavão	4123204	18
3517	Santa Cruz de Monte Castelo	4123303	18
3518	Santa Fé	4123402	18
3519	Santa Helena	4123501	18
3520	Santa Inês	4123600	18
3521	Santa Isabel do Ivaí	4123709	18
3522	Santa Izabel do Oeste	4123808	18
3523	Santa Lúcia	4123824	18
3524	Santa Maria do Oeste	4123857	18
3525	Santa Mariana	4123907	18
3526	Santa Mônica	4123956	18
3527	Santa Tereza do Oeste	4124020	18
3528	Santa Terezinha de Itaipu	4124053	18
3529	Santana do Itararé	4124004	18
3530	Santo Antônio da Platina	4124103	18
3531	Santo Antônio do Caiuá	4124202	18
3532	Santo Antônio do Paraíso	4124301	18
3533	Santo Antônio do Sudoeste	4124400	18
3534	Santo Inácio	4124509	18
3535	São Carlos do Ivaí	4124608	18
3536	São Jerônimo da Serra	4124707	18
3537	São João	4124806	18
3538	São João do Caiuá	4124905	18
3539	São João do Ivaí	4125001	18
3540	São João do Triunfo	4125100	18
3541	São Jorge do Ivaí	4125308	18
3542	São Jorge do Patrocínio	4125357	18
3543	São Jorge d'Oeste	4125209	18
3544	São José da Boa Vista	4125407	18
3545	São José das Palmeiras	4125456	18
3546	São José dos Pinhais	4125506	18
3547	São Manoel do Paraná	4125555	18
3548	São Mateus do Sul	4125605	18
3549	São Miguel do Iguaçu	4125704	18
3550	São Pedro do Iguaçu	4125753	18
3551	São Pedro do Ivaí	4125803	18
3552	São Pedro do Paraná	4125902	18
3553	São Sebastião da Amoreira	4126009	18
3554	São Tomé	4126108	18
3555	Sapopema	4126207	18
3556	Sarandi	4126256	18
3557	Saudade do Iguaçu	4126272	18
3558	Sengés	4126306	18
3559	Serranópolis do Iguaçu	4126355	18
3560	Sertaneja	4126405	18
3561	Sertanópolis	4126504	18
3562	Siqueira Campos	4126603	18
3563	Sulina	4126652	18
3564	Tamarana	4126678	18
3565	Tamboara	4126702	18
3566	Tapejara	4126801	18
3567	Tapira	4126900	18
3568	Teixeira Soares	4127007	18
3569	Telêmaco Borba	4127106	18
3570	Terra Boa	4127205	18
3571	Terra Rica	4127304	18
3572	Terra Roxa	4127403	18
3573	Tibagi	4127502	18
3574	Tijucas do Sul	4127601	18
3575	Toledo	4127700	18
3576	Tomazina	4127809	18
3577	Três Barras do Paraná	4127858	18
3578	Tunas do Paraná	4127882	18
3579	Tuneiras do Oeste	4127908	18
3580	Tupãssi	4127957	18
3581	Turvo	4127965	18
3582	Ubiratã	4128005	18
3583	Umuarama	4128104	18
3584	União da Vitória	4128203	18
3585	Uniflor	4128302	18
3586	Uraí	4128401	18
3587	Ventania	4128534	18
3588	Vera Cruz do Oeste	4128559	18
3589	Verê	4128609	18
3590	Virmond	4128658	18
3591	Vitorino	4128708	18
3592	Wenceslau Braz	4128500	18
3593	Xambrê	4128807	18
3594	Angra dos Reis	3300100	19
3595	Aperibé	3300159	19
3596	Araruama	3300209	19
3597	Areal	3300225	19
3598	Armação dos Búzios	3300233	19
3599	Arraial do Cabo	3300258	19
3600	Barra do Piraí	3300308	19
3601	Barra Mansa	3300407	19
3602	Belford Roxo	3300456	19
3603	Bom Jardim	3300506	19
3604	Bom Jesus do Itabapoana	3300605	19
3605	Cabo Frio	3300704	19
3606	Cachoeiras de Macacu	3300803	19
3607	Cambuci	3300902	19
3608	Campos dos Goytacazes	3301009	19
3609	Cantagalo	3301108	19
3610	Carapebus	3300936	19
3611	Cardoso Moreira	3301157	19
3612	Carmo	3301207	19
3613	Casimiro de Abreu	3301306	19
3614	Comendador Levy Gasparian	3300951	19
3615	Conceição de Macabu	3301405	19
3616	Cordeiro	3301504	19
3617	Duas Barras	3301603	19
3618	Duque de Caxias	3301702	19
3619	Engenheiro Paulo de Frontin	3301801	19
3620	Guapimirim	3301850	19
3621	Iguaba Grande	3301876	19
3622	Itaboraí	3301900	19
3623	Itaguaí	3302007	19
3624	Italva	3302056	19
3625	Itaocara	3302106	19
3626	Itaperuna	3302205	19
3627	Itatiaia	3302254	19
3628	Japeri	3302270	19
3629	Laje do Muriaé	3302304	19
3630	Macaé	3302403	19
3631	Macuco	3302452	19
3632	Magé	3302502	19
3633	Mangaratiba	3302601	19
3634	Maricá	3302700	19
3635	Mendes	3302809	19
3636	Mesquita	3302858	19
3637	Miguel Pereira	3302908	19
3638	Miracema	3303005	19
3639	Natividade	3303104	19
3640	Nilópolis	3303203	19
3641	Niterói	3303302	19
3642	Nova Friburgo	3303401	19
3643	Nova Iguaçu	3303500	19
3644	Paracambi	3303609	19
3645	Paraíba do Sul	3303708	19
3646	Paraty	3303807	19
3647	Paty do Alferes	3303856	19
3648	Petrópolis	3303906	19
3649	Pinheiral	3303955	19
3650	Piraí	3304003	19
3651	Porciúncula	3304102	19
3652	Porto Real	3304110	19
3653	Quatis	3304128	19
3654	Queimados	3304144	19
3655	Quissamã	3304151	19
3656	Resende	3304201	19
3657	Rio Bonito	3304300	19
3658	Rio Claro	3304409	19
3659	Rio das Flores	3304508	19
3660	Rio das Ostras	3304524	19
3661	Rio de Janeiro	3304557	19
3662	Santa Maria Madalena	3304607	19
3663	Santo Antônio de Pádua	3304706	19
3664	São Fidélis	3304805	19
3665	São Francisco de Itabapoana	3304755	19
3666	São Gonçalo	3304904	19
3667	São João da Barra	3305000	19
3668	São João de Meriti	3305109	19
3669	São José de Ubá	3305133	19
3670	São José do Vale do Rio Preto	3305158	19
3671	São Pedro da Aldeia	3305208	19
3672	São Sebastião do Alto	3305307	19
3673	Sapucaia	3305406	19
3674	Saquarema	3305505	19
3675	Seropédica	3305554	19
3676	Silva Jardim	3305604	19
3677	Sumidouro	3305703	19
3678	Tanguá	3305752	19
3679	Teresópolis	3305802	19
3680	Trajano de Moraes	3305901	19
3681	Três Rios	3306008	19
3682	Valença	3306107	19
3683	Varre-Sai	3306156	19
3684	Vassouras	3306206	19
3685	Volta Redonda	3306305	19
3686	Acari	2400109	20
3687	Açu	2400208	20
3688	Afonso Bezerra	2400307	20
3689	Água Nova	2400406	20
3690	Alexandria	2400505	20
3691	Almino Afonso	2400604	20
3692	Alto do Rodrigues	2400703	20
3693	Angicos	2400802	20
3694	Antônio Martins	2400901	20
3695	Apodi	2401008	20
3696	Areia Branca	2401107	20
3697	Arês	2401206	20
3698	Augusto Severo	2401305	20
3699	Baía Formosa	2401404	20
3700	Baraúna	2401453	20
3701	Barcelona	2401503	20
3702	Bento Fernandes	2401602	20
3703	Bodó	2401651	20
3704	Bom Jesus	2401701	20
3705	Brejinho	2401800	20
3706	Caiçara do Norte	2401859	20
3707	Caiçara do Rio do Vento	2401909	20
3708	Caicó	2402006	20
3709	Campo Redondo	2402105	20
3710	Canguaretama	2402204	20
3711	Caraúbas	2402303	20
3712	Carnaúba dos Dantas	2402402	20
3713	Carnaubais	2402501	20
3714	Ceará-Mirim	2402600	20
3715	Cerro Corá	2402709	20
3716	Coronel Ezequiel	2402808	20
3717	Coronel João Pessoa	2402907	20
3718	Cruzeta	2403004	20
3719	Currais Novos	2403103	20
3720	Doutor Severiano	2403202	20
3721	Encanto	2403301	20
3722	Equador	2403400	20
3723	Espírito Santo	2403509	20
3724	Extremoz	2403608	20
3725	Felipe Guerra	2403707	20
3726	Fernando Pedroza	2403756	20
3727	Florânia	2403806	20
3728	Francisco Dantas	2403905	20
3729	Frutuoso Gomes	2404002	20
3730	Galinhos	2404101	20
3731	Goianinha	2404200	20
3732	Governador Dix-Sept Rosado	2404309	20
3733	Grossos	2404408	20
3734	Guamaré	2404507	20
3735	Ielmo Marinho	2404606	20
3736	Ipanguaçu	2404705	20
3737	Ipueira	2404804	20
3738	Itajá	2404853	20
3739	Itaú	2404903	20
3740	Jaçanã	2405009	20
3741	Jandaíra	2405108	20
3742	Janduís	2405207	20
3743	Januário Cicco	2405306	20
3744	Japi	2405405	20
3745	Jardim de Angicos	2405504	20
3746	Jardim de Piranhas	2405603	20
3747	Jardim do Seridó	2405702	20
3748	João Câmara	2405801	20
3749	João Dias	2405900	20
3750	José da Penha	2406007	20
3751	Jucurutu	2406106	20
3752	Jundiá	2406155	20
3753	Lagoa de Pedras	2406304	20
3754	Lagoa de Velhos	2406403	20
3755	Lagoa d'Anta	2406205	20
3756	Lagoa Nova	2406502	20
3757	Lagoa Salgada	2406601	20
3758	Lajes	2406700	20
3759	Lajes Pintadas	2406809	20
3760	Lucrécia	2406908	20
3761	Luís Gomes	2407005	20
3762	Macaíba	2407104	20
3763	Macau	2407203	20
3764	Major Sales	2407252	20
3765	Marcelino Vieira	2407302	20
3766	Martins	2407401	20
3767	Maxaranguape	2407500	20
3768	Messias Targino	2407609	20
3769	Montanhas	2407708	20
3770	Monte Alegre	2407807	20
3771	Monte das Gameleiras	2407906	20
3772	Mossoró	2408003	20
3773	Natal	2408102	20
3774	Nísia Floresta	2408201	20
3775	Nova Cruz	2408300	20
3776	Olho-d'Água do Borges	2408409	20
3777	Ouro Branco	2408508	20
3778	Paraná	2408607	20
3779	Paraú	2408706	20
3780	Parazinho	2408805	20
3781	Parelhas	2408904	20
3782	Parnamirim	2403251	20
3783	Passa e Fica	2409100	20
3784	Passagem	2409209	20
3785	Patu	2409308	20
3786	Pau dos Ferros	2409407	20
3787	Pedra Grande	2409506	20
3788	Pedra Preta	2409605	20
3789	Pedro Avelino	2409704	20
3790	Pedro Velho	2409803	20
3791	Pendências	2409902	20
3792	Pilões	2410009	20
3793	Poço Branco	2410108	20
3794	Portalegre	2410207	20
3795	Porto do Mangue	2410256	20
3796	Pureza	2410405	20
3797	Rafael Fernandes	2410504	20
3798	Rafael Godeiro	2410603	20
3799	Riacho da Cruz	2410702	20
3800	Riacho de Santana	2410801	20
3801	Riachuelo	2410900	20
3802	Rio do Fogo	2408953	20
3803	Rodolfo Fernandes	2411007	20
3804	Ruy Barbosa	2411106	20
3805	Santa Cruz	2411205	20
3806	Santa Maria	2409332	20
3807	Santana do Matos	2411403	20
3808	Santana do Seridó	2411429	20
3809	Santo Antônio	2411502	20
3810	São Bento do Norte	2411601	20
3811	São Bento do Trairí	2411700	20
3812	São Fernando	2411809	20
3813	São Francisco do Oeste	2411908	20
3814	São Gonçalo do Amarante	2412005	20
3815	São João do Sabugi	2412104	20
3816	São José de Mipibu	2412203	20
3817	São José do Campestre	2412302	20
3818	São José do Seridó	2412401	20
3819	São Miguel	2412500	20
3820	São Miguel do Gostoso	2412559	20
3821	São Paulo do Potengi	2412609	20
3822	São Pedro	2412708	20
3823	São Rafael	2412807	20
3824	São Tomé	2412906	20
3825	São Vicente	2413003	20
3826	Senador Elói de Souza	2413102	20
3827	Senador Georgino Avelino	2413201	20
3828	Serra Caiada	2410306	20
3829	Serra de São Bento	2413300	20
3830	Serra do Mel	2413359	20
3831	Serra Negra do Norte	2413409	20
3832	Serrinha	2413508	20
3833	Serrinha dos Pintos	2413557	20
3834	Severiano Melo	2413607	20
3835	Sítio Novo	2413706	20
3836	Taboleiro Grande	2413805	20
3837	Taipu	2413904	20
3838	Tangará	2414001	20
3839	Tenente Ananias	2414100	20
3840	Tenente Laurentino Cruz	2414159	20
3841	Tibau	2411056	20
3842	Tibau do Sul	2414209	20
3843	Timbaúba dos Batistas	2414308	20
3844	Touros	2414407	20
3845	Triunfo Potiguar	2414456	20
3846	Umarizal	2414506	20
3847	Upanema	2414605	20
3848	Várzea	2414704	20
3849	Venha-Ver	2414753	20
3850	Vera Cruz	2414803	20
3851	Viçosa	2414902	20
3852	Vila Flor	2415008	20
3853	Alta Floresta d'Oeste	1100015	21
3854	Alto Alegre dos Parecis	1100379	21
3855	Alto Paraíso	1100403	21
3856	Alvorada d'Oeste	1100346	21
3857	Ariquemes	1100023	21
3858	Buritis	1100452	21
3859	Cabixi	1100031	21
3860	Cacaulândia	1100601	21
3861	Cacoal	1100049	21
3862	Campo Novo de Rondônia	1100700	21
3863	Candeias do Jamari	1100809	21
3864	Castanheiras	1100908	21
3865	Cerejeiras	1100056	21
3866	Chupinguaia	1100924	21
3867	Colorado do Oeste	1100064	21
3868	Corumbiara	1100072	21
3869	Costa Marques	1100080	21
3870	Cujubim	1100940	21
3871	Espigão d'Oeste	1100098	21
3872	Governador Jorge Teixeira	1101005	21
3873	Guajará-Mirim	1100106	21
3874	Itapuã do Oeste	1101104	21
3875	Jaru	1100114	21
3876	Ji-Paraná	1100122	21
3877	Machadinho d'Oeste	1100130	21
3878	Ministro Andreazza	1101203	21
3879	Mirante da Serra	1101302	21
3880	Monte Negro	1101401	21
3881	Nova Brasilândia d'Oeste	1100148	21
3882	Nova Mamoré	1100338	21
3883	Nova União	1101435	21
3884	Novo Horizonte do Oeste	1100502	21
3885	Ouro Preto do Oeste	1100155	21
3886	Parecis	1101450	21
3887	Pimenta Bueno	1100189	21
3888	Pimenteiras do Oeste	1101468	21
3889	Porto Velho	1100205	21
3890	Presidente Médici	1100254	21
3891	Primavera de Rondônia	1101476	21
3892	Rio Crespo	1100262	21
3893	Rolim de Moura	1100288	21
3894	Santa Luzia d'Oeste	1100296	21
3895	São Felipe d'Oeste	1101484	21
3896	São Francisco do Guaporé	1101492	21
3897	São Miguel do Guaporé	1100320	21
3898	Seringueiras	1101500	21
3899	Teixeirópolis	1101559	21
3900	Theobroma	1101609	21
3901	Urupá	1101708	21
3902	Vale do Anari	1101757	21
3903	Vale do Paraíso	1101807	21
3904	Vilhena	1100304	21
3905	Alto Alegre	1400050	22
3906	Amajari	1400027	22
3907	Boa Vista	1400100	22
3908	Bonfim	1400159	22
3909	Cantá	1400175	22
3910	Caracaraí	1400209	22
3911	Caroebe	1400233	22
3912	Iracema	1400282	22
3913	Mucajaí	1400308	22
3914	Normandia	1400407	22
3915	Pacaraima	1400456	22
3916	Rorainópolis	1400472	22
3917	São João da Baliza	1400506	22
3918	São Luiz	1400605	22
3919	Uiramutã	1400704	22
3920	Aceguá	4300034	23
3921	Água Santa	4300059	23
3922	Agudo	4300109	23
3923	Ajuricaba	4300208	23
3924	Alecrim	4300307	23
3925	Alegrete	4300406	23
3926	Alegria	4300455	23
3927	Almirante Tamandaré do Sul	4300471	23
3928	Alpestre	4300505	23
3929	Alto Alegre	4300554	23
3930	Alto Feliz	4300570	23
3931	Alvorada	4300604	23
3932	Amaral Ferrador	4300638	23
3933	Ametista do Sul	4300646	23
3934	André da Rocha	4300661	23
3935	Anta Gorda	4300703	23
3936	Antônio Prado	4300802	23
3937	Arambaré	4300851	23
3938	Araricá	4300877	23
3939	Aratiba	4300901	23
3940	Arroio do Meio	4301008	23
3941	Arroio do Padre	4301073	23
3942	Arroio do Sal	4301057	23
3943	Arroio do Tigre	4301206	23
3944	Arroio dos Ratos	4301107	23
3945	Arroio Grande	4301305	23
3946	Arvorezinha	4301404	23
3947	Augusto Pestana	4301503	23
3948	Áurea	4301552	23
3949	Bagé	4301602	23
3950	Balneário Pinhal	4301636	23
3951	Barão	4301651	23
3952	Barão de Cotegipe	4301701	23
3953	Barão do Triunfo	4301750	23
3954	Barra do Guarita	4301859	23
3955	Barra do Quaraí	4301875	23
3956	Barra do Ribeiro	4301909	23
3957	Barra do Rio Azul	4301925	23
3958	Barra Funda	4301958	23
3959	Barracão	4301800	23
3960	Barros Cassal	4302006	23
3961	Benjamin Constant do Sul	4302055	23
3962	Bento Gonçalves	4302105	23
3963	Boa Vista das Missões	4302154	23
3964	Boa Vista do Buricá	4302204	23
3965	Boa Vista do Cadeado	4302220	23
3966	Boa Vista do Incra	4302238	23
3967	Boa Vista do Sul	4302253	23
3968	Bom Jesus	4302303	23
3969	Bom Princípio	4302352	23
3970	Bom Progresso	4302378	23
3971	Bom Retiro do Sul	4302402	23
3972	Boqueirão do Leão	4302451	23
3973	Bossoroca	4302501	23
3974	Bozano	4302584	23
3975	Braga	4302600	23
3976	Brochier	4302659	23
3977	Butiá	4302709	23
3978	Caçapava do Sul	4302808	23
3979	Cacequi	4302907	23
3980	Cachoeira do Sul	4303004	23
3981	Cachoeirinha	4303103	23
3982	Cacique Doble	4303202	23
3983	Caibaté	4303301	23
3984	Caiçara	4303400	23
3985	Camaquã	4303509	23
3986	Camargo	4303558	23
3987	Cambará do Sul	4303608	23
3988	Campestre da Serra	4303673	23
3989	Campina das Missões	4303707	23
3990	Campinas do Sul	4303806	23
3991	Campo Bom	4303905	23
3992	Campo Novo	4304002	23
3993	Campos Borges	4304101	23
3994	Candelária	4304200	23
3995	Cândido Godói	4304309	23
3996	Candiota	4304358	23
3997	Canela	4304408	23
3998	Canguçu	4304507	23
3999	Canoas	4304606	23
4000	Canudos do Vale	4304614	23
4001	Capão Bonito do Sul	4304622	23
4002	Capão da Canoa	4304630	23
4003	Capão do Cipó	4304655	23
4004	Capão do Leão	4304663	23
4005	Capela de Santana	4304689	23
4006	Capitão	4304697	23
4007	Capivari do Sul	4304671	23
4008	Caraá	4304713	23
4009	Carazinho	4304705	23
4010	Carlos Barbosa	4304804	23
4011	Carlos Gomes	4304853	23
4012	Casca	4304903	23
4013	Caseiros	4304952	23
4014	Catuípe	4305009	23
4015	Caxias do Sul	4305108	23
4016	Centenário	4305116	23
4017	Cerrito	4305124	23
4018	Cerro Branco	4305132	23
4019	Cerro Grande	4305157	23
4020	Cerro Grande do Sul	4305173	23
4021	Cerro Largo	4305207	23
4022	Chapada	4305306	23
4023	Charqueadas	4305355	23
4024	Charrua	4305371	23
4025	Chiapetta	4305405	23
4026	Chuí	4305439	23
4027	Chuvisca	4305447	23
4028	Cidreira	4305454	23
4029	Ciríaco	4305504	23
4030	Colinas	4305587	23
4031	Colorado	4305603	23
4032	Condor	4305702	23
4033	Constantina	4305801	23
4034	Coqueiro Baixo	4305835	23
4035	Coqueiros do Sul	4305850	23
4036	Coronel Barros	4305871	23
4037	Coronel Bicaco	4305900	23
4038	Coronel Pilar	4305934	23
4039	Cotiporã	4305959	23
4040	Coxilha	4305975	23
4041	Crissiumal	4306007	23
4042	Cristal	4306056	23
4043	Cristal do Sul	4306072	23
4044	Cruz Alta	4306106	23
4045	Cruzaltense	4306130	23
4046	Cruzeiro do Sul	4306205	23
4047	David Canabarro	4306304	23
4048	Derrubadas	4306320	23
4049	Dezesseis de Novembro	4306353	23
4050	Dilermando de Aguiar	4306379	23
4051	Dois Irmãos	4306403	23
4052	Dois Irmãos das Missões	4306429	23
4053	Dois Lajeados	4306452	23
4054	Dom Feliciano	4306502	23
4055	Dom Pedrito	4306601	23
4056	Dom Pedro de Alcântara	4306551	23
4057	Dona Francisca	4306700	23
4058	Doutor Maurício Cardoso	4306734	23
4059	Doutor Ricardo	4306759	23
4060	Eldorado do Sul	4306767	23
4061	Encantado	4306809	23
4062	Encruzilhada do Sul	4306908	23
4063	Engenho Velho	4306924	23
4064	Entre Rios do Sul	4306957	23
4065	Entre-Ijuís	4306932	23
4066	Erebango	4306973	23
4067	Erechim	4307005	23
4068	Ernestina	4307054	23
4069	Erval Grande	4307203	23
4070	Erval Seco	4307302	23
4071	Esmeralda	4307401	23
4072	Esperança do Sul	4307450	23
4073	Espumoso	4307500	23
4074	Estação	4307559	23
4075	Estância Velha	4307609	23
4076	Esteio	4307708	23
4077	Estrela	4307807	23
4078	Estrela Velha	4307815	23
4079	Eugênio de Castro	4307831	23
4080	Fagundes Varela	4307864	23
4081	Farroupilha	4307906	23
4082	Faxinal do Soturno	4308003	23
4083	Faxinalzinho	4308052	23
4084	Fazenda Vilanova	4308078	23
4085	Feliz	4308102	23
4086	Flores da Cunha	4308201	23
4087	Floriano Peixoto	4308250	23
4088	Fontoura Xavier	4308300	23
4089	Formigueiro	4308409	23
4090	Forquetinha	4308433	23
4091	Fortaleza dos Valos	4308458	23
4092	Frederico Westphalen	4308508	23
4093	Garibaldi	4308607	23
4094	Garruchos	4308656	23
4095	Gaurama	4308706	23
4096	General Câmara	4308805	23
4097	Gentil	4308854	23
4098	Getúlio Vargas	4308904	23
4099	Giruá	4309001	23
4100	Glorinha	4309050	23
4101	Gramado	4309100	23
4102	Gramado dos Loureiros	4309126	23
4103	Gramado Xavier	4309159	23
4104	Gravataí	4309209	23
4105	Guabiju	4309258	23
4106	Guaíba	4309308	23
4107	Guaporé	4309407	23
4108	Guarani das Missões	4309506	23
4109	Harmonia	4309555	23
4110	Herval	4307104	23
4111	Herveiras	4309571	23
4112	Horizontina	4309605	23
4113	Hulha Negra	4309654	23
4114	Humaitá	4309704	23
4115	Ibarama	4309753	23
4116	Ibiaçá	4309803	23
4117	Ibiraiaras	4309902	23
4118	Ibirapuitã	4309951	23
4119	Ibirubá	4310009	23
4120	Igrejinha	4310108	23
4121	Ijuí	4310207	23
4122	Ilópolis	4310306	23
4123	Imbé	4310330	23
4124	Imigrante	4310363	23
4125	Independência	4310405	23
4126	Inhacorá	4310413	23
4127	Ipê	4310439	23
4128	Ipiranga do Sul	4310462	23
4129	Iraí	4310504	23
4130	Itaara	4310538	23
4131	Itacurubi	4310553	23
4132	Itapuca	4310579	23
4133	Itaqui	4310603	23
4134	Itati	4310652	23
4135	Itatiba do Sul	4310702	23
4136	Ivorá	4310751	23
4137	Ivoti	4310801	23
4138	Jaboticaba	4310850	23
4139	Jacuizinho	4310876	23
4140	Jacutinga	4310900	23
4141	Jaguarão	4311007	23
4142	Jaguari	4311106	23
4143	Jaquirana	4311122	23
4144	Jari	4311130	23
4145	Jóia	4311155	23
4146	Júlio de Castilhos	4311205	23
4147	Lagoa Bonita do Sul	4311239	23
4148	Lagoa dos Três Cantos	4311270	23
4149	Lagoa Vermelha	4311304	23
4150	Lagoão	4311254	23
4151	Lajeado	4311403	23
4152	Lajeado do Bugre	4311429	23
4153	Lavras do Sul	4311502	23
4154	Liberato Salzano	4311601	23
4155	Lindolfo Collor	4311627	23
4156	Linha Nova	4311643	23
4157	Maçambará	4311718	23
4158	Machadinho	4311700	23
4159	Mampituba	4311734	23
4160	Manoel Viana	4311759	23
4161	Maquiné	4311775	23
4162	Maratá	4311791	23
4163	Marau	4311809	23
4164	Marcelino Ramos	4311908	23
4165	Mariana Pimentel	4311981	23
4166	Mariano Moro	4312005	23
4167	Marques de Souza	4312054	23
4168	Mata	4312104	23
4169	Mato Castelhano	4312138	23
4170	Mato Leitão	4312153	23
4171	Mato Queimado	4312179	23
4172	Maximiliano de Almeida	4312203	23
4173	Minas do Leão	4312252	23
4174	Miraguaí	4312302	23
4175	Montauri	4312351	23
4176	Monte Alegre dos Campos	4312377	23
4177	Monte Belo do Sul	4312385	23
4178	Montenegro	4312401	23
4179	Mormaço	4312427	23
4180	Morrinhos do Sul	4312443	23
4181	Morro Redondo	4312450	23
4182	Morro Reuter	4312476	23
4183	Mostardas	4312500	23
4184	Muçum	4312609	23
4185	Muitos Capões	4312617	23
4186	Muliterno	4312625	23
4187	Não-Me-Toque	4312658	23
4188	Nicolau Vergueiro	4312674	23
4189	Nonoai	4312708	23
4190	Nova Alvorada	4312757	23
4191	Nova Araçá	4312807	23
4192	Nova Bassano	4312906	23
4193	Nova Boa Vista	4312955	23
4194	Nova Bréscia	4313003	23
4195	Nova Candelária	4313011	23
4196	Nova Esperança do Sul	4313037	23
4197	Nova Hartz	4313060	23
4198	Nova Pádua	4313086	23
4199	Nova Palma	4313102	23
4200	Nova Petrópolis	4313201	23
4201	Nova Prata	4313300	23
4202	Nova Ramada	4313334	23
4203	Nova Roma do Sul	4313359	23
4204	Nova Santa Rita	4313375	23
4205	Novo Barreiro	4313490	23
4206	Novo Cabrais	4313391	23
4207	Novo Hamburgo	4313409	23
4208	Novo Machado	4313425	23
4209	Novo Tiradentes	4313441	23
4210	Novo Xingu	4313466	23
4211	Osório	4313508	23
4212	Paim Filho	4313607	23
4213	Palmares do Sul	4313656	23
4214	Palmeira das Missões	4313706	23
4215	Palmitinho	4313805	23
4216	Panambi	4313904	23
4217	Pantano Grande	4313953	23
4218	Paraí	4314001	23
4219	Paraíso do Sul	4314027	23
4220	Pareci Novo	4314035	23
4221	Parobé	4314050	23
4222	Passa Sete	4314068	23
4223	Passo do Sobrado	4314076	23
4224	Passo Fundo	4314100	23
4225	Paulo Bento	4314134	23
4226	Paverama	4314159	23
4227	Pedras Altas	4314175	23
4228	Pedro Osório	4314209	23
4229	Pejuçara	4314308	23
4230	Pelotas	4314407	23
4231	Picada Café	4314423	23
4232	Pinhal	4314456	23
4233	Pinhal da Serra	4314464	23
4234	Pinhal Grande	4314472	23
4235	Pinheirinho do Vale	4314498	23
4236	Pinheiro Machado	4314506	23
4237	Pinto Bandeira	4314548	23
4238	Pirapó	4314555	23
4239	Piratini	4314605	23
4240	Planalto	4314704	23
4241	Poço das Antas	4314753	23
4242	Pontão	4314779	23
4243	Ponte Preta	4314787	23
4244	Portão	4314803	23
4245	Porto Alegre	4314902	23
4246	Porto Lucena	4315008	23
4247	Porto Mauá	4315057	23
4248	Porto Vera Cruz	4315073	23
4249	Porto Xavier	4315107	23
4250	Pouso Novo	4315131	23
4251	Presidente Lucena	4315149	23
4252	Progresso	4315156	23
4253	Protásio Alves	4315172	23
4254	Putinga	4315206	23
4255	Quaraí	4315305	23
4256	Quatro Irmãos	4315313	23
4257	Quevedos	4315321	23
4258	Quinze de Novembro	4315354	23
4259	Redentora	4315404	23
4260	Relvado	4315453	23
4261	Restinga Seca	4315503	23
4262	Rio dos Índios	4315552	23
4263	Rio Grande	4315602	23
4264	Rio Pardo	4315701	23
4265	Riozinho	4315750	23
4266	Roca Sales	4315800	23
4267	Rodeio Bonito	4315909	23
4268	Rolador	4315958	23
4269	Rolante	4316006	23
4270	Ronda Alta	4316105	23
4271	Rondinha	4316204	23
4272	Roque Gonzales	4316303	23
4273	Rosário do Sul	4316402	23
4274	Sagrada Família	4316428	23
4275	Saldanha Marinho	4316436	23
4276	Salto do Jacuí	4316451	23
4277	Salvador das Missões	4316477	23
4278	Salvador do Sul	4316501	23
4279	Sananduva	4316600	23
4280	Sant'Ana do Livramento	4317103	23
4281	Santa Bárbara do Sul	4316709	23
4282	Santa Cecília do Sul	4316733	23
4283	Santa Clara do Sul	4316758	23
4284	Santa Cruz do Sul	4316808	23
4285	Santa Margarida do Sul	4316972	23
4286	Santa Maria	4316907	23
4287	Santa Maria do Herval	4316956	23
4288	Santa Rosa	4317202	23
4289	Santa Tereza	4317251	23
4290	Santa Vitória do Palmar	4317301	23
4291	Santana da Boa Vista	4317004	23
4292	Santiago	4317400	23
4293	Santo Ângelo	4317509	23
4294	Santo Antônio da Patrulha	4317608	23
4295	Santo Antônio das Missões	4317707	23
4296	Santo Antônio do Palma	4317558	23
4297	Santo Antônio do Planalto	4317756	23
4298	Santo Augusto	4317806	23
4299	Santo Cristo	4317905	23
4300	Santo Expedito do Sul	4317954	23
4301	São Borja	4318002	23
4302	São Domingos do Sul	4318051	23
4303	São Francisco de Assis	4318101	23
4304	São Francisco de Paula	4318200	23
4305	São Gabriel	4318309	23
4306	São Jerônimo	4318408	23
4307	São João da Urtiga	4318424	23
4308	São João do Polêsine	4318432	23
4309	São Jorge	4318440	23
4310	São José das Missões	4318457	23
4311	São José do Herval	4318465	23
4312	São José do Hortêncio	4318481	23
4313	São José do Inhacorá	4318499	23
4314	São José do Norte	4318507	23
4315	São José do Ouro	4318606	23
4316	São José do Sul	4318614	23
4317	São José dos Ausentes	4318622	23
4318	São Leopoldo	4318705	23
4319	São Lourenço do Sul	4318804	23
4320	São Luiz Gonzaga	4318903	23
4321	São Marcos	4319000	23
4322	São Martinho	4319109	23
4323	São Martinho da Serra	4319125	23
4324	São Miguel das Missões	4319158	23
4325	São Nicolau	4319208	23
4326	São Paulo das Missões	4319307	23
4327	São Pedro da Serra	4319356	23
4328	São Pedro das Missões	4319364	23
4329	São Pedro do Butiá	4319372	23
4330	São Pedro do Sul	4319406	23
4331	São Sebastião do Caí	4319505	23
4332	São Sepé	4319604	23
4333	São Valentim	4319703	23
4334	São Valentim do Sul	4319711	23
4335	São Valério do Sul	4319737	23
4336	São Vendelino	4319752	23
4337	São Vicente do Sul	4319802	23
4338	Sapiranga	4319901	23
4339	Sapucaia do Sul	4320008	23
4340	Sarandi	4320107	23
4341	Seberi	4320206	23
4342	Sede Nova	4320230	23
4343	Segredo	4320263	23
4344	Selbach	4320305	23
4345	Senador Salgado Filho	4320321	23
4346	Sentinela do Sul	4320354	23
4347	Serafina Corrêa	4320404	23
4348	Sério	4320453	23
4349	Sertão	4320503	23
4350	Sertão Santana	4320552	23
4351	Sete de Setembro	4320578	23
4352	Severiano de Almeida	4320602	23
4353	Silveira Martins	4320651	23
4354	Sinimbu	4320677	23
4355	Sobradinho	4320701	23
4356	Soledade	4320800	23
4357	Tabaí	4320859	23
4358	Tapejara	4320909	23
4359	Tapera	4321006	23
4360	Tapes	4321105	23
4361	Taquara	4321204	23
4362	Taquari	4321303	23
4363	Taquaruçu do Sul	4321329	23
4364	Tavares	4321352	23
4365	Tenente Portela	4321402	23
4366	Terra de Areia	4321436	23
4367	Teutônia	4321451	23
4368	Tio Hugo	4321469	23
4369	Tiradentes do Sul	4321477	23
4370	Toropi	4321493	23
4371	Torres	4321501	23
4372	Tramandaí	4321600	23
4373	Travesseiro	4321626	23
4374	Três Arroios	4321634	23
4375	Três Cachoeiras	4321667	23
4376	Três Coroas	4321709	23
4377	Três de Maio	4321808	23
4378	Três Forquilhas	4321832	23
4379	Três Palmeiras	4321857	23
4380	Três Passos	4321907	23
4381	Trindade do Sul	4321956	23
4382	Triunfo	4322004	23
4383	Tucunduva	4322103	23
4384	Tunas	4322152	23
4385	Tupanci do Sul	4322186	23
4386	Tupanciretã	4322202	23
4387	Tupandi	4322251	23
4388	Tuparendi	4322301	23
4389	Turuçu	4322327	23
4390	Ubiretama	4322343	23
4391	União da Serra	4322350	23
4392	Unistalda	4322376	23
4393	Uruguaiana	4322400	23
4394	Vacaria	4322509	23
4395	Vale do Sol	4322533	23
4396	Vale Real	4322541	23
4397	Vale Verde	4322525	23
4398	Vanini	4322558	23
4399	Venâncio Aires	4322608	23
4400	Vera Cruz	4322707	23
4401	Veranópolis	4322806	23
4402	Vespasiano Correa	4322855	23
4403	Viadutos	4322905	23
4404	Viamão	4323002	23
4405	Vicente Dutra	4323101	23
4406	Victor Graeff	4323200	23
4407	Vila Flores	4323309	23
4408	Vila Lângaro	4323358	23
4409	Vila Maria	4323408	23
4410	Vila Nova do Sul	4323457	23
4411	Vista Alegre	4323507	23
4412	Vista Alegre do Prata	4323606	23
4413	Vista Gaúcha	4323705	23
4414	Vitória das Missões	4323754	23
4415	Westfália	4323770	23
4416	Xangri-lá	4323804	23
4417	Abdon Batista	4200051	24
4418	Abelardo Luz	4200101	24
4419	Agrolândia	4200200	24
4420	Agronômica	4200309	24
4421	Água Doce	4200408	24
4422	Águas de Chapecó	4200507	24
4423	Águas Frias	4200556	24
4424	Águas Mornas	4200606	24
4425	Alfredo Wagner	4200705	24
4426	Alto Bela Vista	4200754	24
4427	Anchieta	4200804	24
4428	Angelina	4200903	24
4429	Anita Garibaldi	4201000	24
4430	Anitápolis	4201109	24
4431	Antônio Carlos	4201208	24
4432	Apiúna	4201257	24
4433	Arabutã	4201273	24
4434	Araquari	4201307	24
4435	Araranguá	4201406	24
4436	Armazém	4201505	24
4437	Arroio Trinta	4201604	24
4438	Arvoredo	4201653	24
4439	Ascurra	4201703	24
4440	Atalanta	4201802	24
4441	Aurora	4201901	24
4442	Balneário Arroio do Silva	4201950	24
4443	Balneário Barra do Sul	4202057	24
4444	Balneário Camboriú	4202008	24
4445	Balneário Gaivota	4202073	24
4446	Balneário Piçarras	4212809	24
4447	Balneário Rincão	4220000	24
4448	Bandeirante	4202081	24
4449	Barra Bonita	4202099	24
4450	Barra Velha	4202107	24
4451	Bela Vista do Toldo	4202131	24
4452	Belmonte	4202156	24
4453	Benedito Novo	4202206	24
4454	Biguaçu	4202305	24
4455	Blumenau	4202404	24
4456	Bocaina do Sul	4202438	24
4457	Bom Jardim da Serra	4202503	24
4458	Bom Jesus	4202537	24
4459	Bom Jesus do Oeste	4202578	24
4460	Bom Retiro	4202602	24
4461	Bombinhas	4202453	24
4462	Botuverá	4202701	24
4463	Braço do Norte	4202800	24
4464	Braço do Trombudo	4202859	24
4465	Brunópolis	4202875	24
4466	Brusque	4202909	24
4467	Caçador	4203006	24
4468	Caibi	4203105	24
4469	Calmon	4203154	24
4470	Camboriú	4203204	24
4471	Campo Alegre	4203303	24
4472	Campo Belo do Sul	4203402	24
4473	Campo Erê	4203501	24
4474	Campos Novos	4203600	24
4475	Canelinha	4203709	24
4476	Canoinhas	4203808	24
4477	Capão Alto	4203253	24
4478	Capinzal	4203907	24
4479	Capivari de Baixo	4203956	24
4480	Catanduvas	4204004	24
4481	Caxambu do Sul	4204103	24
4482	Celso Ramos	4204152	24
4483	Cerro Negro	4204178	24
4484	Chapadão do Lageado	4204194	24
4485	Chapecó	4204202	24
4486	Cocal do Sul	4204251	24
4487	Concórdia	4204301	24
4488	Cordilheira Alta	4204350	24
4489	Coronel Freitas	4204400	24
4490	Coronel Martins	4204459	24
4491	Correia Pinto	4204558	24
4492	Corupá	4204509	24
4493	Criciúma	4204608	24
4494	Cunha Porã	4204707	24
4495	Cunhataí	4204756	24
4496	Curitibanos	4204806	24
4497	Descanso	4204905	24
4498	Dionísio Cerqueira	4205001	24
4499	Dona Emma	4205100	24
4500	Doutor Pedrinho	4205159	24
4501	Entre Rios	4205175	24
4502	Ermo	4205191	24
4503	Erval Velho	4205209	24
4504	Faxinal dos Guedes	4205308	24
4505	Flor do Sertão	4205357	24
4506	Florianópolis	4205407	24
4507	Formosa do Sul	4205431	24
4508	Forquilhinha	4205456	24
4509	Fraiburgo	4205506	24
4510	Frei Rogério	4205555	24
4511	Galvão	4205605	24
4512	Garopaba	4205704	24
4513	Garuva	4205803	24
4514	Gaspar	4205902	24
4515	Governador Celso Ramos	4206009	24
4516	Grão Pará	4206108	24
4517	Gravatal	4206207	24
4518	Guabiruba	4206306	24
4519	Guaraciaba	4206405	24
4520	Guaramirim	4206504	24
4521	Guarujá do Sul	4206603	24
4522	Guatambú	4206652	24
4523	Herval d'Oeste	4206702	24
4524	Ibiam	4206751	24
4525	Ibicaré	4206801	24
4526	Ibirama	4206900	24
4527	Içara	4207007	24
4528	Ilhota	4207106	24
4529	Imaruí	4207205	24
4530	Imbituba	4207304	24
4531	Imbuia	4207403	24
4532	Indaial	4207502	24
4533	Iomerê	4207577	24
4534	Ipira	4207601	24
4535	Iporã do Oeste	4207650	24
4536	Ipuaçu	4207684	24
4537	Ipumirim	4207700	24
4538	Iraceminha	4207759	24
4539	Irani	4207809	24
4540	Irati	4207858	24
4541	Irineópolis	4207908	24
4542	Itá	4208005	24
4543	Itaiópolis	4208104	24
4544	Itajaí	4208203	24
4545	Itapema	4208302	24
4546	Itapiranga	4208401	24
4547	Itapoá	4208450	24
4548	Ituporanga	4208500	24
4549	Jaborá	4208609	24
4550	Jacinto Machado	4208708	24
4551	Jaguaruna	4208807	24
4552	Jaraguá do Sul	4208906	24
4553	Jardinópolis	4208955	24
4554	Joaçaba	4209003	24
4555	Joinville	4209102	24
4556	José Boiteux	4209151	24
4557	Jupiá	4209177	24
4558	Lacerdópolis	4209201	24
4559	Lages	4209300	24
4560	Laguna	4209409	24
4561	Lajeado Grande	4209458	24
4562	Laurentino	4209508	24
4563	Lauro Muller	4209607	24
4564	Lebon Régis	4209706	24
4565	Leoberto Leal	4209805	24
4566	Lindóia do Sul	4209854	24
4567	Lontras	4209904	24
4568	Luiz Alves	4210001	24
4569	Luzerna	4210035	24
4570	Macieira	4210050	24
4571	Mafra	4210100	24
4572	Major Gercino	4210209	24
4573	Major Vieira	4210308	24
4574	Maracajá	4210407	24
4575	Maravilha	4210506	24
4576	Marema	4210555	24
4577	Massaranduba	4210605	24
4578	Matos Costa	4210704	24
4579	Meleiro	4210803	24
4580	Mirim Doce	4210852	24
4581	Modelo	4210902	24
4582	Mondaí	4211009	24
4583	Monte Carlo	4211058	24
4584	Monte Castelo	4211108	24
4585	Morro da Fumaça	4211207	24
4586	Morro Grande	4211256	24
4587	Navegantes	4211306	24
4588	Nova Erechim	4211405	24
4589	Nova Itaberaba	4211454	24
4590	Nova Trento	4211504	24
4591	Nova Veneza	4211603	24
4592	Novo Horizonte	4211652	24
4593	Orleans	4211702	24
4594	Otacílio Costa	4211751	24
4595	Ouro	4211801	24
4596	Ouro Verde	4211850	24
4597	Paial	4211876	24
4598	Painel	4211892	24
4599	Palhoça	4211900	24
4600	Palma Sola	4212007	24
4601	Palmeira	4212056	24
4602	Palmitos	4212106	24
4603	Papanduva	4212205	24
4604	Paraíso	4212239	24
4605	Passo de Torres	4212254	24
4606	Passos Maia	4212270	24
4607	Paulo Lopes	4212304	24
4608	Pedras Grandes	4212403	24
4609	Penha	4212502	24
4610	Peritiba	4212601	24
4611	Pescaria Brava	4212650	24
4612	Petrolândia	4212700	24
4613	Pinhalzinho	4212908	24
4614	Pinheiro Preto	4213005	24
4615	Piratuba	4213104	24
4616	Planalto Alegre	4213153	24
4617	Pomerode	4213203	24
4618	Ponte Alta	4213302	24
4619	Ponte Alta do Norte	4213351	24
4620	Ponte Serrada	4213401	24
4621	Porto Belo	4213500	24
4622	Porto União	4213609	24
4623	Pouso Redondo	4213708	24
4624	Praia Grande	4213807	24
4625	Presidente Castello Branco	4213906	24
4626	Presidente Getúlio	4214003	24
4627	Presidente Nereu	4214102	24
4628	Princesa	4214151	24
4629	Quilombo	4214201	24
4630	Rancho Queimado	4214300	24
4631	Rio das Antas	4214409	24
4632	Rio do Campo	4214508	24
4633	Rio do Oeste	4214607	24
4634	Rio do Sul	4214805	24
4635	Rio dos Cedros	4214706	24
4636	Rio Fortuna	4214904	24
4637	Rio Negrinho	4215000	24
4638	Rio Rufino	4215059	24
4639	Riqueza	4215075	24
4640	Rodeio	4215109	24
4641	Romelândia	4215208	24
4642	Salete	4215307	24
4643	Saltinho	4215356	24
4644	Salto Veloso	4215406	24
4645	Sangão	4215455	24
4646	Santa Cecília	4215505	24
4647	Santa Helena	4215554	24
4648	Santa Rosa de Lima	4215604	24
4649	Santa Rosa do Sul	4215653	24
4650	Santa Terezinha	4215679	24
4651	Santa Terezinha do Progresso	4215687	24
4652	Santiago do Sul	4215695	24
4653	Santo Amaro da Imperatriz	4215703	24
4654	São Bento do Sul	4215802	24
4655	São Bernardino	4215752	24
4656	São Bonifácio	4215901	24
4657	São Carlos	4216008	24
4658	São Cristovão do Sul	4216057	24
4659	São Domingos	4216107	24
4660	São Francisco do Sul	4216206	24
4661	São João Batista	4216305	24
4662	São João do Itaperiú	4216354	24
4663	São João do Oeste	4216255	24
4664	São João do Sul	4216404	24
4665	São Joaquim	4216503	24
4666	São José	4216602	24
4667	São José do Cedro	4216701	24
4668	São José do Cerrito	4216800	24
4669	São Lourenço do Oeste	4216909	24
4670	São Ludgero	4217006	24
4671	São Martinho	4217105	24
4672	São Miguel da Boa Vista	4217154	24
4673	São Miguel do Oeste	4217204	24
4674	São Pedro de Alcântara	4217253	24
4675	Saudades	4217303	24
4676	Schroeder	4217402	24
4677	Seara	4217501	24
4678	Serra Alta	4217550	24
4679	Siderópolis	4217600	24
4680	Sombrio	4217709	24
4681	Sul Brasil	4217758	24
4682	Taió	4217808	24
4683	Tangará	4217907	24
4684	Tigrinhos	4217956	24
4685	Tijucas	4218004	24
4686	Timbé do Sul	4218103	24
4687	Timbó	4218202	24
4688	Timbó Grande	4218251	24
4689	Três Barras	4218301	24
4690	Treviso	4218350	24
4691	Treze de Maio	4218400	24
4692	Treze Tílias	4218509	24
4693	Trombudo Central	4218608	24
4694	Tubarão	4218707	24
4695	Tunápolis	4218756	24
4696	Turvo	4218806	24
4697	União do Oeste	4218855	24
4698	Urubici	4218905	24
4699	Urupema	4218954	24
4700	Urussanga	4219002	24
4701	Vargeão	4219101	24
4702	Vargem	4219150	24
4703	Vargem Bonita	4219176	24
4704	Vidal Ramos	4219200	24
4705	Videira	4219309	24
4706	Vitor Meireles	4219358	24
4707	Witmarsum	4219408	24
4708	Xanxerê	4219507	24
4709	Xavantina	4219606	24
4710	Xaxim	4219705	24
4711	Zortéa	4219853	24
4712	Amparo de São Francisco	2800100	25
4713	Aquidabã	2800209	25
4714	Aracaju	2800308	25
4715	Arauá	2800407	25
4716	Areia Branca	2800506	25
4717	Barra dos Coqueiros	2800605	25
4718	Boquim	2800670	25
4719	Brejo Grande	2800704	25
4720	Campo do Brito	2801009	25
4721	Canhoba	2801108	25
4722	Canindé de São Francisco	2801207	25
4723	Capela	2801306	25
4724	Carira	2801405	25
4725	Carmópolis	2801504	25
4726	Cedro de São João	2801603	25
4727	Cristinápolis	2801702	25
4728	Cumbe	2801900	25
4729	Divina Pastora	2802007	25
4730	Estância	2802106	25
4731	Feira Nova	2802205	25
4732	Frei Paulo	2802304	25
4733	Gararu	2802403	25
4734	General Maynard	2802502	25
4735	Gracho Cardoso	2802601	25
4736	Ilha das Flores	2802700	25
4737	Indiaroba	2802809	25
4738	Itabaiana	2802908	25
4739	Itabaianinha	2803005	25
4740	Itabi	2803104	25
4741	Itaporanga d'Ajuda	2803203	25
4742	Japaratuba	2803302	25
4743	Japoatã	2803401	25
4744	Lagarto	2803500	25
4745	Laranjeiras	2803609	25
4746	Macambira	2803708	25
4747	Malhada dos Bois	2803807	25
4748	Malhador	2803906	25
4749	Maruim	2804003	25
4750	Moita Bonita	2804102	25
4751	Monte Alegre de Sergipe	2804201	25
4752	Muribeca	2804300	25
4753	Neópolis	2804409	25
4754	Nossa Senhora Aparecida	2804458	25
4755	Nossa Senhora da Glória	2804508	25
4756	Nossa Senhora das Dores	2804607	25
4757	Nossa Senhora de Lourdes	2804706	25
4758	Nossa Senhora do Socorro	2804805	25
4759	Pacatuba	2804904	25
4760	Pedra Mole	2805000	25
4761	Pedrinhas	2805109	25
4762	Pinhão	2805208	25
4763	Pirambu	2805307	25
4764	Poço Redondo	2805406	25
4765	Poço Verde	2805505	25
4766	Porto da Folha	2805604	25
4767	Propriá	2805703	25
4768	Riachão do Dantas	2805802	25
4769	Riachuelo	2805901	25
4770	Ribeirópolis	2806008	25
4771	Rosário do Catete	2806107	25
4772	Salgado	2806206	25
4773	Santa Luzia do Itanhy	2806305	25
4774	Santa Rosa de Lima	2806503	25
4775	Santana do São Francisco	2806404	25
4776	Santo Amaro das Brotas	2806602	25
4777	São Cristóvão	2806701	25
4778	São Domingos	2806800	25
4779	São Francisco	2806909	25
4780	São Miguel do Aleixo	2807006	25
4781	Simão Dias	2807105	25
4782	Siriri	2807204	25
4783	Telha	2807303	25
4784	Tobias Barreto	2807402	25
4785	Tomar do Geru	2807501	25
4786	Umbaúba	2807600	25
4787	Adamantina	3500105	26
4788	Adolfo	3500204	26
4789	Aguaí	3500303	26
4790	Águas da Prata	3500402	26
4791	Águas de Lindóia	3500501	26
4792	Águas de Santa Bárbara	3500550	26
4793	Águas de São Pedro	3500600	26
4794	Agudos	3500709	26
4795	Alambari	3500758	26
4796	Alfredo Marcondes	3500808	26
4797	Altair	3500907	26
4798	Altinópolis	3501004	26
4799	Alto Alegre	3501103	26
4800	Alumínio	3501152	26
4801	Álvares Florence	3501202	26
4802	Álvares Machado	3501301	26
4803	Álvaro de Carvalho	3501400	26
4804	Alvinlândia	3501509	26
4805	Americana	3501608	26
4806	Américo Brasiliense	3501707	26
4807	Américo de Campos	3501806	26
4808	Amparo	3501905	26
4809	Analândia	3502002	26
4810	Andradina	3502101	26
4811	Angatuba	3502200	26
4812	Anhembi	3502309	26
4813	Anhumas	3502408	26
4814	Aparecida	3502507	26
4815	Aparecida d'Oeste	3502606	26
4816	Apiaí	3502705	26
4817	Araçariguama	3502754	26
4818	Araçatuba	3502804	26
4819	Araçoiaba da Serra	3502903	26
4820	Aramina	3503000	26
4821	Arandu	3503109	26
4822	Arapeí	3503158	26
4823	Araraquara	3503208	26
4824	Araras	3503307	26
4825	Arco-Íris	3503356	26
4826	Arealva	3503406	26
4827	Areias	3503505	26
4828	Areiópolis	3503604	26
4829	Ariranha	3503703	26
4830	Artur Nogueira	3503802	26
4831	Arujá	3503901	26
4832	Aspásia	3503950	26
4833	Assis	3504008	26
4834	Atibaia	3504107	26
4835	Auriflama	3504206	26
4836	Avaí	3504305	26
4837	Avanhandava	3504404	26
4838	Avaré	3504503	26
4839	Bady Bassitt	3504602	26
4840	Balbinos	3504701	26
4841	Bálsamo	3504800	26
4842	Bananal	3504909	26
4843	Barão de Antonina	3505005	26
4844	Barbosa	3505104	26
4845	Bariri	3505203	26
4846	Barra Bonita	3505302	26
4847	Barra do Chapéu	3505351	26
4848	Barra do Turvo	3505401	26
4849	Barretos	3505500	26
4850	Barrinha	3505609	26
4851	Barueri	3505708	26
4852	Bastos	3505807	26
4853	Batatais	3505906	26
4854	Bauru	3506003	26
4855	Bebedouro	3506102	26
4856	Bento de Abreu	3506201	26
4857	Bernardino de Campos	3506300	26
4858	Bertioga	3506359	26
4859	Bilac	3506409	26
4860	Birigui	3506508	26
4861	Biritiba-Mirim	3506607	26
4862	Boa Esperança do Sul	3506706	26
4863	Bocaina	3506805	26
4864	Bofete	3506904	26
4865	Boituva	3507001	26
4866	Bom Jesus dos Perdões	3507100	26
4867	Bom Sucesso de Itararé	3507159	26
4868	Borá	3507209	26
4869	Boracéia	3507308	26
4870	Borborema	3507407	26
4871	Borebi	3507456	26
4872	Botucatu	3507506	26
4873	Bragança Paulista	3507605	26
4874	Braúna	3507704	26
4875	Brejo Alegre	3507753	26
4876	Brodowski	3507803	26
4877	Brotas	3507902	26
4878	Buri	3508009	26
4879	Buritama	3508108	26
4880	Buritizal	3508207	26
4881	Cabrália Paulista	3508306	26
4882	Cabreúva	3508405	26
4883	Caçapava	3508504	26
4884	Cachoeira Paulista	3508603	26
4885	Caconde	3508702	26
4886	Cafelândia	3508801	26
4887	Caiabu	3508900	26
4888	Caieiras	3509007	26
4889	Caiuá	3509106	26
4890	Cajamar	3509205	26
4891	Cajati	3509254	26
4892	Cajobi	3509304	26
4893	Cajuru	3509403	26
4894	Campina do Monte Alegre	3509452	26
4895	Campinas	3509502	26
4896	Campo Limpo Paulista	3509601	26
4897	Campos do Jordão	3509700	26
4898	Campos Novos Paulista	3509809	26
4899	Cananéia	3509908	26
4900	Canas	3509957	26
4901	Cândido Mota	3510005	26
4902	Cândido Rodrigues	3510104	26
4903	Canitar	3510153	26
4904	Capão Bonito	3510203	26
4905	Capela do Alto	3510302	26
4906	Capivari	3510401	26
4907	Caraguatatuba	3510500	26
4908	Carapicuíba	3510609	26
4909	Cardoso	3510708	26
4910	Casa Branca	3510807	26
4911	Cássia dos Coqueiros	3510906	26
4912	Castilho	3511003	26
4913	Catanduva	3511102	26
4914	Catiguá	3511201	26
4915	Cedral	3511300	26
4916	Cerqueira César	3511409	26
4917	Cerquilho	3511508	26
4918	Cesário Lange	3511607	26
4919	Charqueada	3511706	26
4920	Chavantes	3557204	26
4921	Clementina	3511904	26
4922	Colina	3512001	26
4923	Colômbia	3512100	26
4924	Conchal	3512209	26
4925	Conchas	3512308	26
4926	Cordeirópolis	3512407	26
4927	Coroados	3512506	26
4928	Coronel Macedo	3512605	26
4929	Corumbataí	3512704	26
4930	Cosmópolis	3512803	26
4931	Cosmorama	3512902	26
4932	Cotia	3513009	26
4933	Cravinhos	3513108	26
4934	Cristais Paulista	3513207	26
4935	Cruzália	3513306	26
4936	Cruzeiro	3513405	26
4937	Cubatão	3513504	26
4938	Cunha	3513603	26
4939	Descalvado	3513702	26
4940	Diadema	3513801	26
4941	Dirce Reis	3513850	26
4942	Divinolândia	3513900	26
4943	Dobrada	3514007	26
4944	Dois Córregos	3514106	26
4945	Dolcinópolis	3514205	26
4946	Dourado	3514304	26
4947	Dracena	3514403	26
4948	Duartina	3514502	26
4949	Dumont	3514601	26
4950	Echaporã	3514700	26
4951	Eldorado	3514809	26
4952	Elias Fausto	3514908	26
4953	Elisiário	3514924	26
4954	Embaúba	3514957	26
4955	Embu das Artes	3515004	26
4956	Embu-Guaçu	3515103	26
4957	Emilianópolis	3515129	26
4958	Engenheiro Coelho	3515152	26
4959	Espírito Santo do Pinhal	3515186	26
4960	Espírito Santo do Turvo	3515194	26
4961	Estiva Gerbi	3557303	26
4962	Estrela do Norte	3515301	26
4963	Estrela d'Oeste	3515202	26
4964	Euclides da Cunha Paulista	3515350	26
4965	Fartura	3515400	26
4966	Fernando Prestes	3515608	26
4967	Fernandópolis	3515509	26
4968	Fernão	3515657	26
4969	Ferraz de Vasconcelos	3515707	26
4970	Flora Rica	3515806	26
4971	Floreal	3515905	26
4972	Flórida Paulista	3516002	26
4973	Florínia	3516101	26
4974	Franca	3516200	26
4975	Francisco Morato	3516309	26
4976	Franco da Rocha	3516408	26
4977	Gabriel Monteiro	3516507	26
4978	Gália	3516606	26
4979	Garça	3516705	26
4980	Gastão Vidigal	3516804	26
4981	Gavião Peixoto	3516853	26
4982	General Salgado	3516903	26
4983	Getulina	3517000	26
4984	Glicério	3517109	26
4985	Guaiçara	3517208	26
4986	Guaimbê	3517307	26
4987	Guaíra	3517406	26
4988	Guapiaçu	3517505	26
4989	Guapiara	3517604	26
4990	Guará	3517703	26
4991	Guaraçaí	3517802	26
4992	Guaraci	3517901	26
4993	Guarani d'Oeste	3518008	26
4994	Guarantã	3518107	26
4995	Guararapes	3518206	26
4996	Guararema	3518305	26
4997	Guaratinguetá	3518404	26
4998	Guareí	3518503	26
4999	Guariba	3518602	26
5000	Guarujá	3518701	26
5001	Guarulhos	3518800	26
5002	Guatapará	3518859	26
5003	Guzolândia	3518909	26
5004	Herculândia	3519006	26
5005	Holambra	3519055	26
5006	Hortolândia	3519071	26
5007	Iacanga	3519105	26
5008	Iacri	3519204	26
5009	Iaras	3519253	26
5010	Ibaté	3519303	26
5011	Ibirá	3519402	26
5012	Ibirarema	3519501	26
5013	Ibitinga	3519600	26
5014	Ibiúna	3519709	26
5015	Icém	3519808	26
5016	Iepê	3519907	26
5017	Igaraçu do Tietê	3520004	26
5018	Igarapava	3520103	26
5019	Igaratá	3520202	26
5020	Iguape	3520301	26
5021	Ilha Comprida	3520426	26
5022	Ilha Solteira	3520442	26
5023	Ilhabela	3520400	26
5024	Indaiatuba	3520509	26
5025	Indiana	3520608	26
5026	Indiaporã	3520707	26
5027	Inúbia Paulista	3520806	26
5028	Ipaussu	3520905	26
5029	Iperó	3521002	26
5030	Ipeúna	3521101	26
5031	Ipiguá	3521150	26
5032	Iporanga	3521200	26
5033	Ipuã	3521309	26
5034	Iracemápolis	3521408	26
5035	Irapuã	3521507	26
5036	Irapuru	3521606	26
5037	Itaberá	3521705	26
5038	Itaí	3521804	26
5039	Itajobi	3521903	26
5040	Itaju	3522000	26
5041	Itanhaém	3522109	26
5042	Itaóca	3522158	26
5043	Itapecerica da Serra	3522208	26
5044	Itapetininga	3522307	26
5045	Itapeva	3522406	26
5046	Itapevi	3522505	26
5047	Itapira	3522604	26
5048	Itapirapuã Paulista	3522653	26
5049	Itápolis	3522703	26
5050	Itaporanga	3522802	26
5051	Itapuí	3522901	26
5052	Itapura	3523008	26
5053	Itaquaquecetuba	3523107	26
5054	Itararé	3523206	26
5055	Itariri	3523305	26
5056	Itatiba	3523404	26
5057	Itatinga	3523503	26
5058	Itirapina	3523602	26
5059	Itirapuã	3523701	26
5060	Itobi	3523800	26
5061	Itu	3523909	26
5062	Itupeva	3524006	26
5063	Ituverava	3524105	26
5064	Jaborandi	3524204	26
5065	Jaboticabal	3524303	26
5066	Jacareí	3524402	26
5067	Jaci	3524501	26
5068	Jacupiranga	3524600	26
5069	Jaguariúna	3524709	26
5070	Jales	3524808	26
5071	Jambeiro	3524907	26
5072	Jandira	3525003	26
5073	Jardinópolis	3525102	26
5074	Jarinu	3525201	26
5075	Jaú	3525300	26
5076	Jeriquara	3525409	26
5077	Joanópolis	3525508	26
5078	João Ramalho	3525607	26
5079	José Bonifácio	3525706	26
5080	Júlio Mesquita	3525805	26
5081	Jumirim	3525854	26
5082	Jundiaí	3525904	26
5083	Junqueirópolis	3526001	26
5084	Juquiá	3526100	26
5085	Juquitiba	3526209	26
5086	Lagoinha	3526308	26
5087	Laranjal Paulista	3526407	26
5088	Lavínia	3526506	26
5089	Lavrinhas	3526605	26
5090	Leme	3526704	26
5091	Lençóis Paulista	3526803	26
5092	Limeira	3526902	26
5093	Lindóia	3527009	26
5094	Lins	3527108	26
5095	Lorena	3527207	26
5096	Lourdes	3527256	26
5097	Louveira	3527306	26
5098	Lucélia	3527405	26
5099	Lucianópolis	3527504	26
5100	Luís Antônio	3527603	26
5101	Luiziânia	3527702	26
5102	Lupércio	3527801	26
5103	Lutécia	3527900	26
5104	Macatuba	3528007	26
5105	Macaubal	3528106	26
5106	Macedônia	3528205	26
5107	Magda	3528304	26
5108	Mairinque	3528403	26
5109	Mairiporã	3528502	26
5110	Manduri	3528601	26
5111	Marabá Paulista	3528700	26
5112	Maracaí	3528809	26
5113	Marapoama	3528858	26
5114	Mariápolis	3528908	26
5115	Marília	3529005	26
5116	Marinópolis	3529104	26
5117	Martinópolis	3529203	26
5118	Matão	3529302	26
5119	Mauá	3529401	26
5120	Mendonça	3529500	26
5121	Meridiano	3529609	26
5122	Mesópolis	3529658	26
5123	Miguelópolis	3529708	26
5124	Mineiros do Tietê	3529807	26
5125	Mira Estrela	3530003	26
5126	Miracatu	3529906	26
5127	Mirandópolis	3530102	26
5128	Mirante do Paranapanema	3530201	26
5129	Mirassol	3530300	26
5130	Mirassolândia	3530409	26
5131	Mococa	3530508	26
5132	Mogi das Cruzes	3530607	26
5133	Mogi Guaçu	3530706	26
5134	Mogi Mirim	3530805	26
5135	Mombuca	3530904	26
5136	Monções	3531001	26
5137	Mongaguá	3531100	26
5138	Monte Alegre do Sul	3531209	26
5139	Monte Alto	3531308	26
5140	Monte Aprazível	3531407	26
5141	Monte Azul Paulista	3531506	26
5142	Monte Castelo	3531605	26
5143	Monte Mor	3531803	26
5144	Monteiro Lobato	3531704	26
5145	Morro Agudo	3531902	26
5146	Morungaba	3532009	26
5147	Motuca	3532058	26
5148	Murutinga do Sul	3532108	26
5149	Nantes	3532157	26
5150	Narandiba	3532207	26
5151	Natividade da Serra	3532306	26
5152	Nazaré Paulista	3532405	26
5153	Neves Paulista	3532504	26
5154	Nhandeara	3532603	26
5155	Nipoã	3532702	26
5156	Nova Aliança	3532801	26
5157	Nova Campina	3532827	26
5158	Nova Canaã Paulista	3532843	26
5159	Nova Castilho	3532868	26
5160	Nova Europa	3532900	26
5161	Nova Granada	3533007	26
5162	Nova Guataporanga	3533106	26
5163	Nova Independência	3533205	26
5164	Nova Luzitânia	3533304	26
5165	Nova Odessa	3533403	26
5166	Novais	3533254	26
5167	Novo Horizonte	3533502	26
5168	Nuporanga	3533601	26
5169	Ocauçu	3533700	26
5170	Óleo	3533809	26
5171	Olímpia	3533908	26
5172	Onda Verde	3534005	26
5173	Oriente	3534104	26
5174	Orindiúva	3534203	26
5175	Orlândia	3534302	26
5176	Osasco	3534401	26
5177	Oscar Bressane	3534500	26
5178	Osvaldo Cruz	3534609	26
5179	Ourinhos	3534708	26
5180	Ouro Verde	3534807	26
5181	Ouroeste	3534757	26
5182	Pacaembu	3534906	26
5183	Palestina	3535002	26
5184	Palmares Paulista	3535101	26
5185	Palmeira d'Oeste	3535200	26
5186	Palmital	3535309	26
5187	Panorama	3535408	26
5188	Paraguaçu Paulista	3535507	26
5189	Paraibuna	3535606	26
5190	Paraíso	3535705	26
5191	Paranapanema	3535804	26
5192	Paranapuã	3535903	26
5193	Parapuã	3536000	26
5194	Pardinho	3536109	26
5195	Pariquera-Açu	3536208	26
5196	Parisi	3536257	26
5197	Patrocínio Paulista	3536307	26
5198	Paulicéia	3536406	26
5199	Paulínia	3536505	26
5200	Paulistânia	3536570	26
5201	Paulo de Faria	3536604	26
5202	Pederneiras	3536703	26
5203	Pedra Bela	3536802	26
5204	Pedranópolis	3536901	26
5205	Pedregulho	3537008	26
5206	Pedreira	3537107	26
5207	Pedrinhas Paulista	3537156	26
5208	Pedro de Toledo	3537206	26
5209	Penápolis	3537305	26
5210	Pereira Barreto	3537404	26
5211	Pereiras	3537503	26
5212	Peruíbe	3537602	26
5213	Piacatu	3537701	26
5214	Piedade	3537800	26
5215	Pilar do Sul	3537909	26
5216	Pindamonhangaba	3538006	26
5217	Pindorama	3538105	26
5218	Pinhalzinho	3538204	26
5219	Piquerobi	3538303	26
5220	Piquete	3538501	26
5221	Piracaia	3538600	26
5222	Piracicaba	3538709	26
5223	Piraju	3538808	26
5224	Pirajuí	3538907	26
5225	Pirangi	3539004	26
5226	Pirapora do Bom Jesus	3539103	26
5227	Pirapozinho	3539202	26
5228	Pirassununga	3539301	26
5229	Piratininga	3539400	26
5230	Pitangueiras	3539509	26
5231	Planalto	3539608	26
5232	Platina	3539707	26
5233	Poá	3539806	26
5234	Poloni	3539905	26
5235	Pompéia	3540002	26
5236	Pongaí	3540101	26
5237	Pontal	3540200	26
5238	Pontalinda	3540259	26
5239	Pontes Gestal	3540309	26
5240	Populina	3540408	26
5241	Porangaba	3540507	26
5242	Porto Feliz	3540606	26
5243	Porto Ferreira	3540705	26
5244	Potim	3540754	26
5245	Potirendaba	3540804	26
5246	Pracinha	3540853	26
5247	Pradópolis	3540903	26
5248	Praia Grande	3541000	26
5249	Pratânia	3541059	26
5250	Presidente Alves	3541109	26
5251	Presidente Bernardes	3541208	26
5252	Presidente Epitácio	3541307	26
5253	Presidente Prudente	3541406	26
5254	Presidente Venceslau	3541505	26
5255	Promissão	3541604	26
5256	Quadra	3541653	26
5257	Quatá	3541703	26
5258	Queiroz	3541802	26
5259	Queluz	3541901	26
5260	Quintana	3542008	26
5261	Rafard	3542107	26
5262	Rancharia	3542206	26
5263	Redenção da Serra	3542305	26
5264	Regente Feijó	3542404	26
5265	Reginópolis	3542503	26
5266	Registro	3542602	26
5267	Restinga	3542701	26
5268	Ribeira	3542800	26
5269	Ribeirão Bonito	3542909	26
5270	Ribeirão Branco	3543006	26
5271	Ribeirão Corrente	3543105	26
5272	Ribeirão do Sul	3543204	26
5273	Ribeirão dos Índios	3543238	26
5274	Ribeirão Grande	3543253	26
5275	Ribeirão Pires	3543303	26
5276	Ribeirão Preto	3543402	26
5277	Rifaina	3543600	26
5278	Rincão	3543709	26
5279	Rinópolis	3543808	26
5280	Rio Claro	3543907	26
5281	Rio das Pedras	3544004	26
5282	Rio Grande da Serra	3544103	26
5283	Riolândia	3544202	26
5284	Riversul	3543501	26
5285	Rosana	3544251	26
5286	Roseira	3544301	26
5287	Rubiácea	3544400	26
5288	Rubinéia	3544509	26
5289	Sabino	3544608	26
5290	Sagres	3544707	26
5291	Sales	3544806	26
5292	Sales Oliveira	3544905	26
5293	Salesópolis	3545001	26
5294	Salmourão	3545100	26
5295	Saltinho	3545159	26
5296	Salto	3545209	26
5297	Salto de Pirapora	3545308	26
5298	Salto Grande	3545407	26
5299	Sandovalina	3545506	26
5300	Santa Adélia	3545605	26
5301	Santa Albertina	3545704	26
5302	Santa Bárbara d'Oeste	3545803	26
5303	Santa Branca	3546009	26
5304	Santa Clara d'Oeste	3546108	26
5305	Santa Cruz da Conceição	3546207	26
5306	Santa Cruz da Esperança	3546256	26
5307	Santa Cruz das Palmeiras	3546306	26
5308	Santa Cruz do Rio Pardo	3546405	26
5309	Santa Ernestina	3546504	26
5310	Santa Fé do Sul	3546603	26
5311	Santa Gertrudes	3546702	26
5312	Santa Isabel	3546801	26
5313	Santa Lúcia	3546900	26
5314	Santa Maria da Serra	3547007	26
5315	Santa Mercedes	3547106	26
5316	Santa Rita do Passa Quatro	3547502	26
5317	Santa Rita d'Oeste	3547403	26
5318	Santa Rosa de Viterbo	3547601	26
5319	Santa Salete	3547650	26
5320	Santana da Ponte Pensa	3547205	26
5321	Santana de Parnaíba	3547304	26
5322	Santo Anastácio	3547700	26
5323	Santo André	3547809	26
5324	Santo Antônio da Alegria	3547908	26
5325	Santo Antônio de Posse	3548005	26
5326	Santo Antônio do Aracanguá	3548054	26
5327	Santo Antônio do Jardim	3548104	26
5328	Santo Antônio do Pinhal	3548203	26
5329	Santo Expedito	3548302	26
5330	Santópolis do Aguapeí	3548401	26
5331	Santos	3548500	26
5332	São Bento do Sapucaí	3548609	26
5333	São Bernardo do Campo	3548708	26
5334	São Caetano do Sul	3548807	26
5335	São Carlos	3548906	26
5336	São Francisco	3549003	26
5337	São João da Boa Vista	3549102	26
5338	São João das Duas Pontes	3549201	26
5339	São João de Iracema	3549250	26
5340	São João do Pau d'Alho	3549300	26
5341	São Joaquim da Barra	3549409	26
5342	São José da Bela Vista	3549508	26
5343	São José do Barreiro	3549607	26
5344	São José do Rio Pardo	3549706	26
5345	São José do Rio Preto	3549805	26
5346	São José dos Campos	3549904	26
5347	São Lourenço da Serra	3549953	26
5348	São Luís do Paraitinga	3550001	26
5349	São Manuel	3550100	26
5350	São Miguel Arcanjo	3550209	26
5351	São Paulo	3550308	26
5352	São Pedro	3550407	26
5353	São Pedro do Turvo	3550506	26
5354	São Roque	3550605	26
5355	São Sebastião	3550704	26
5356	São Sebastião da Grama	3550803	26
5357	São Simão	3550902	26
5358	São Vicente	3551009	26
5359	Sarapuí	3551108	26
5360	Sarutaiá	3551207	26
5361	Sebastianópolis do Sul	3551306	26
5362	Serra Azul	3551405	26
5363	Serra Negra	3551603	26
5364	Serrana	3551504	26
5365	Sertãozinho	3551702	26
5366	Sete Barras	3551801	26
5367	Severínia	3551900	26
5368	Silveiras	3552007	26
5369	Socorro	3552106	26
5370	Sorocaba	3552205	26
5371	Sud Mennucci	3552304	26
5372	Sumaré	3552403	26
5373	Suzanápolis	3552551	26
5374	Suzano	3552502	26
5375	Tabapuã	3552601	26
5376	Tabatinga	3552700	26
5377	Taboão da Serra	3552809	26
5378	Taciba	3552908	26
5379	Taguaí	3553005	26
5380	Taiaçu	3553104	26
5381	Taiúva	3553203	26
5382	Tambaú	3553302	26
5383	Tanabi	3553401	26
5384	Tapiraí	3553500	26
5385	Tapiratiba	3553609	26
5386	Taquaral	3553658	26
5387	Taquaritinga	3553708	26
5388	Taquarituba	3553807	26
5389	Taquarivaí	3553856	26
5390	Tarabai	3553906	26
5391	Tarumã	3553955	26
5392	Tatuí	3554003	26
5393	Taubaté	3554102	26
5394	Tejupá	3554201	26
5395	Teodoro Sampaio	3554300	26
5396	Terra Roxa	3554409	26
5397	Tietê	3554508	26
5398	Timburi	3554607	26
5399	Torre de Pedra	3554656	26
5400	Torrinha	3554706	26
5401	Trabiju	3554755	26
5402	Tremembé	3554805	26
5403	Três Fronteiras	3554904	26
5404	Tuiuti	3554953	26
5405	Tupã	3555000	26
5406	Tupi Paulista	3555109	26
5407	Turiúba	3555208	26
5408	Turmalina	3555307	26
5409	Ubarana	3555356	26
5410	Ubatuba	3555406	26
5411	Ubirajara	3555505	26
5412	Uchoa	3555604	26
5413	União Paulista	3555703	26
5414	Urânia	3555802	26
5415	Uru	3555901	26
5416	Urupês	3556008	26
5417	Valentim Gentil	3556107	26
5418	Valinhos	3556206	26
5419	Valparaíso	3556305	26
5420	Vargem	3556354	26
5421	Vargem Grande do Sul	3556404	26
5422	Vargem Grande Paulista	3556453	26
5423	Várzea Paulista	3556503	26
5424	Vera Cruz	3556602	26
5425	Vinhedo	3556701	26
5426	Viradouro	3556800	26
5427	Vista Alegre do Alto	3556909	26
5428	Vitória Brasil	3556958	26
5429	Votorantim	3557006	26
5430	Votuporanga	3557105	26
5431	Zacarias	3557154	26
5432	Abreulândia	1700251	27
5433	Aguiarnópolis	1700301	27
5434	Aliança do Tocantins	1700350	27
5435	Almas	1700400	27
5436	Alvorada	1700707	27
5437	Ananás	1701002	27
5438	Angico	1701051	27
5439	Aparecida do Rio Negro	1701101	27
5440	Aragominas	1701309	27
5441	Araguacema	1701903	27
5442	Araguaçu	1702000	27
5443	Araguaína	1702109	27
5444	Araguanã	1702158	27
5445	Araguatins	1702208	27
5446	Arapoema	1702307	27
5447	Arraias	1702406	27
5448	Augustinópolis	1702554	27
5449	Aurora do Tocantins	1702703	27
5450	Axixá do Tocantins	1702901	27
5451	Babaçulândia	1703008	27
5452	Bandeirantes do Tocantins	1703057	27
5453	Barra do Ouro	1703073	27
5454	Barrolândia	1703107	27
5455	Bernardo Sayão	1703206	27
5456	Bom Jesus do Tocantins	1703305	27
5457	Brasilândia do Tocantins	1703602	27
5458	Brejinho de Nazaré	1703701	27
5459	Buriti do Tocantins	1703800	27
5460	Cachoeirinha	1703826	27
5461	Campos Lindos	1703842	27
5462	Cariri do Tocantins	1703867	27
5463	Carmolândia	1703883	27
5464	Carrasco Bonito	1703891	27
5465	Caseara	1703909	27
5466	Centenário	1704105	27
5467	Chapada da Natividade	1705102	27
5468	Chapada de Areia	1704600	27
5469	Colinas do Tocantins	1705508	27
5470	Colméia	1716703	27
5471	Combinado	1705557	27
5472	Conceição do Tocantins	1705607	27
5473	Couto Magalhães	1706001	27
5474	Cristalândia	1706100	27
5475	Crixás do Tocantins	1706258	27
5476	Darcinópolis	1706506	27
5477	Dianópolis	1707009	27
5478	Divinópolis do Tocantins	1707108	27
5479	Dois Irmãos do Tocantins	1707207	27
5480	Dueré	1707306	27
5481	Esperantina	1707405	27
5482	Fátima	1707553	27
5483	Figueirópolis	1707652	27
5484	Filadélfia	1707702	27
5485	Formoso do Araguaia	1708205	27
5486	Fortaleza do Tabocão	1708254	27
5487	Goianorte	1708304	27
5488	Goiatins	1709005	27
5489	Guaraí	1709302	27
5490	Gurupi	1709500	27
5491	Ipueiras	1709807	27
5492	Itacajá	1710508	27
5493	Itaguatins	1710706	27
5494	Itapiratins	1710904	27
5495	Itaporã do Tocantins	1711100	27
5496	Jaú do Tocantins	1711506	27
5497	Juarina	1711803	27
5498	Lagoa da Confusão	1711902	27
5499	Lagoa do Tocantins	1711951	27
5500	Lajeado	1712009	27
5501	Lavandeira	1712157	27
5502	Lizarda	1712405	27
5503	Luzinópolis	1712454	27
5504	Marianópolis do Tocantins	1712504	27
5505	Mateiros	1712702	27
5506	Maurilândia do Tocantins	1712801	27
5507	Miracema do Tocantins	1713205	27
5508	Miranorte	1713304	27
5509	Monte do Carmo	1713601	27
5510	Monte Santo do Tocantins	1713700	27
5511	Muricilândia	1713957	27
5512	Natividade	1714203	27
5513	Nazaré	1714302	27
5514	Nova Olinda	1714880	27
5515	Nova Rosalândia	1715002	27
5516	Novo Acordo	1715101	27
5517	Novo Alegre	1715150	27
5518	Novo Jardim	1715259	27
5519	Oliveira de Fátima	1715507	27
5520	Palmas	1721000	27
5521	Palmeirante	1715705	27
5522	Palmeiras do Tocantins	1713809	27
5523	Palmeirópolis	1715754	27
5524	Paraíso do Tocantins	1716109	27
5525	Paranã	1716208	27
5526	Pau d'Arco	1716307	27
5527	Pedro Afonso	1716505	27
5528	Peixe	1716604	27
5529	Pequizeiro	1716653	27
5530	Pindorama do Tocantins	1717008	27
5531	Piraquê	1717206	27
5532	Pium	1717503	27
5533	Ponte Alta do Bom Jesus	1717800	27
5534	Ponte Alta do Tocantins	1717909	27
5535	Porto Alegre do Tocantins	1718006	27
5536	Porto Nacional	1718204	27
5537	Praia Norte	1718303	27
5538	Presidente Kennedy	1718402	27
5539	Pugmil	1718451	27
5540	Recursolândia	1718501	27
5541	Riachinho	1718550	27
5542	Rio da Conceição	1718659	27
5543	Rio dos Bois	1718709	27
5544	Rio Sono	1718758	27
5545	Sampaio	1718808	27
5546	Sandolândia	1718840	27
5547	Santa Fé do Araguaia	1718865	27
5548	Santa Maria do Tocantins	1718881	27
5549	Santa Rita do Tocantins	1718899	27
5550	Santa Rosa do Tocantins	1718907	27
5551	Santa Tereza do Tocantins	1719004	27
5552	Santa Terezinha do Tocantins	1720002	27
5553	São Bento do Tocantins	1720101	27
5554	São Félix do Tocantins	1720150	27
5555	São Miguel do Tocantins	1720200	27
5556	São Salvador do Tocantins	1720259	27
5557	São Sebastião do Tocantins	1720309	27
5558	São Valério	1720499	27
5559	Silvanópolis	1720655	27
5560	Sítio Novo do Tocantins	1720804	27
5561	Sucupira	1720853	27
5562	Taguatinga	1720903	27
5563	Taipas do Tocantins	1720937	27
5564	Talismã	1720978	27
5565	Tocantínia	1721109	27
5566	Tocantinópolis	1721208	27
5567	Tupirama	1721257	27
5568	Tupiratins	1721307	27
5569	Wanderlândia	1722081	27
5570	Xambioá	1722107	27
\.


--
-- Data for Name: geodata_country; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY geodata_country (id, name, code, "default") FROM stdin;
1	Brasil	BR	t
\.


--
-- Data for Name: geodata_state; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY geodata_state (id, name, code, country_id) FROM stdin;
1	Acre	AC	1
2	Alagoas	AL	1
3	Amazonas	AM	1
4	Amapá	AP	1
5	Bahia	BA	1
6	Ceará	CE	1
7	Distrito Federal	DF	1
8	Espirito Santo	ES	1
9	Goiás	GO	1
10	Maranhão	MA	1
11	Minas Gerais	MG	1
12	Mato Grosso do Sul	MS	1
13	Mato Grosso	MT	1
14	Pará	PA	1
15	Paraíba	PB	1
16	Pernambuco	PE	1
17	Piauí	PI	1
18	Paraná	PR	1
19	Rio de Janeiro	RJ	1
20	Rio Grande do Norte	RN	1
21	Rondônia	RO	1
22	Roraima	RR	1
23	Rio Grande do Sul	RS	1
24	Santa Catarina	SC	1
25	Sergipe	SE	1
26	São Paulo	SP	1
27	Tocantins	TO	1
\.


--
-- Data for Name: marketing_company; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_company (id, name, segment_id, solution_id, state_id) FROM stdin;
\.


--
-- Data for Name: marketing_pilotcompany; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_pilotcompany (id, company_name, trading_name, cnpj, segment_id, size_id, solution_id, state_id) FROM stdin;
\.


--
-- Data for Name: marketing_pilotcompanycontact; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_pilotcompanycontact (id, name, occupation, email, phone, pilot_company_id) FROM stdin;
\.


--
-- Data for Name: marketing_pilotresults; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_pilotresults (id, results, pilot_company_id) FROM stdin;
\.


--
-- Data for Name: marketing_technologytransfer; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_technologytransfer (id, can_coperform, can_sell_rights, can_hire, solution_id) FROM stdin;
\.


--
-- Data for Name: marketing_unlistedreferencefile; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY marketing_unlistedreferencefile (id, observation, solution_id) FROM stdin;
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY profiles_profile (id, phone, cargo, category_id, regional_id, user_id) FROM stdin;
1	\N	\N	\N	\N	1
2	\N	\N	\N	\N	2
3	\N	\N	\N	\N	3
4	\N	\N	\N	\N	4
5	\N	\N	\N	\N	5
6	\N	\N	\N	\N	6
\.


--
-- Data for Name: received_messages_receivedmessage; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY received_messages_receivedmessage (send_date, id, name, email, company, phone, contact_method, message, returned, readed, category_id, state_id) FROM stdin;
\.


--
-- Data for Name: references_reference; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY references_reference (id, name, occupation, phone, email, solution_id, type_id, user_id) FROM stdin;
\.


--
-- Data for Name: references_type; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY references_type (id, name, slug) FROM stdin;
1	Referência de mercado	referencia-de-mercado
2	Referência técnica	referencia-tecnica
\.


--
-- Data for Name: results_result; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY results_result (id, description, impact_deadline, solution_id, user_id, type_id, step_id) FROM stdin;
\.


--
-- Data for Name: results_resulttype; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY results_resulttype (id, name, slug) FROM stdin;
1	Redução de doenças	reducao-de-doencas
2	Redução de fatores de risco	reducao-de-fatores-de-risco
3	Redução de afastamento / incapacidade para o trabalho	reducao-de-afastamento-incapacidade-para-o-trabalho
4	Redução com gastos com SST	reducao-com-gastos-com-sst
5	Redução de acidentes	reducao-de-acidentes
6	Melhoria no processo de gestão de SST e PS	melhoria-no-processo-de-gestao-de-sst-e-ps
7	Aumento do grau de conhecimento sobre os temas acima	aumento-do-grau-de-conhecimento-sobre-os-temas-acima
\.


--
-- Data for Name: solutions_action; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_action (id, name, slug, namespace, status_id, "order", icon_class, is_modal, modal_file, modal_id, permission_id, active, next_status_id, solution_field_name, solution_field_value, success_message) FROM stdin;
1	Enviar para o DN	enviar-para-o-dn	solutions:solution_update_status	1	0	\N	f	\N	\N	203	t	2	\N	\N	Solução encaminhada com sucesso
2	Aprovar	aprovar	solutions:solution_update_status	2	10	\N	f	\N	\N	201	t	3	is_approved	True	Solução aprovada com sucesso
3	Reprovar	reprovar	solutions:solution_update_status	2	20	\N	f	\N	\N	202	t	4	is_rejected	True	Solução reprovada com sucesso
\.


--
-- Data for Name: solutions_category; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_category (id, name, slug, icon_class) FROM stdin;
1	Higiene Ocupacional	higiene-ocupacional	icon-aesicon-solucoes-higiene
2	Ergonomia	ergonomia	icon-aesicon-solucoes-ergonomia
3	Fatores Psicossociais	fatores-psicossociais	icon-aesicon-solucoes-psicossociais
4	Prevenção da incapacidade	prevencao-da-incapacidade	icon-aesicon-solucoes-prevencao
5	Longevididade e produtividade	longevididade-e-produtividade	icon-aesicon-solucoes-longetividade
6	Sistema de gestão em SST	sistema-de-gestao-em-sst	icon-aesicon-solucoes-gestao
7	Economia para saúde e segurança	economia-para-saude-e-seguranca	icon-aesicon-solucoes-saude
8	Tecnologia para saúde	tecnologia-para-saude	icon-aesicon-solucoes-tecnologia
9	Sistemas de gestão em SST	sistemas-de-gestao-em-sst	icon-aesicon-solucoes-gestao
\.


--
-- Data for Name: solutions_contactrequest; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_contactrequest (id, date_added, name, email, phone, solution_id, uf_id, returned) FROM stdin;
\.


--
-- Data for Name: solutions_region; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_region (id, name, slug) FROM stdin;
\.


--
-- Data for Name: solutions_segment; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_segment (id, name, slug) FROM stdin;
1	Agricultura, pecuária, produção florestal, pesca e aqüicultura	agricultura-pecuaria-producao-florestal-pesca-e-aquicultura
2	Indústrias extrativas	industrias-extrativas
3	Indústrias de transformação	industrias-de-transformacao
4	Eletricidade e gás	eletricidade-e-gas
5	Água, esgoto, atividades de gestão de resíduos e descontaminação	agua-esgoto-atividades-de-gestao-de-residuos-e-descontaminacao
6	Construção	construcao
7	Comércio; reparação de veículos automotores e motocicletas	comercio-reparacao-de-veiculos-automotores-e-motocicletas
8	Transporte, armazenagem e correio	transporte-armazenagem-e-correio
9	Alojamento e alimentação	alojamento-e-alimentacao
10	Informação e comunicação	informacao-e-comunicacao
11	Atividades financeiras, de seguros e serviços relacionados	atividades-financeiras-de-seguros-e-servicos-relacionados
12	Atividades imobiliárias    Atividades profissionais, científicas e técnicas	atividades-imobiliarias-atividades-profissionais-cientificas-e-tecnicas
13	Atividades administrativas e serviços complementares	atividades-administrativas-e-servicos-complementares
14	Administração pública, defesa e seguridade social	administracao-publica-defesa-e-seguridade-social
15	Educação	educacao
16	Saúde humana e serviços sociais	saude-humana-e-servicos-sociais
17	Artes, cultura, esporte e recreação	artes-cultura-esporte-e-recreacao
18	Outras	outras
\.


--
-- Data for Name: solutions_size; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_size (id, name, slug) FROM stdin;
1	Micro	micro
2	Pequeno	pequeno
3	Médio	medio
4	Grande	grande
\.


--
-- Data for Name: solutions_solution; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_solution (id, name, slug, motivation, goal_general, goal_specific, category_id, user_id, banner, extra_expenses, can_reach_others, can_create_new_services, desc_methodology, template, can_reach_other_types, future_services, impact_evaluation, mapped_companies, unlisted_documentation, segment_id, size_id, active, is_approved, is_premium, is_rejected) FROM stdin;
\.


--
-- Data for Name: solutions_solutionstatus; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_solutionstatus (date_added, id, solution_id, status_id, user_id) FROM stdin;
\.


--
-- Data for Name: solutions_status; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY solutions_status (id, name, slug, "order", allow_update, show_adjustments, next_status_id) FROM stdin;
1	Rascunho	rascunho	10	t	t	\N
2	Aguardando avaliação do DN	aguardando-avaliacao-do-dn	20	f	f	\N
3	Aprovada	aprovada	90	f	f	\N
4	Reprovada	reprovada	90	f	f	\N
\.


--
-- Data for Name: surveys_answer; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY surveys_answer (id, text, "order", points, question_id) FROM stdin;
\.


--
-- Data for Name: surveys_question; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY surveys_question (id, text, "order") FROM stdin;
\.


--
-- Data for Name: surveys_survey; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY surveys_survey (date, id, solution_id, user_id) FROM stdin;
\.


--
-- Data for Name: surveys_useranswer; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY surveys_useranswer (date_added, id, answer_id, survey_id) FROM stdin;
\.


--
-- Data for Name: testimonials_testimonial; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY testimonials_testimonial (id, name, occupation, date, testimonial, video, picture, "authorization", solution_id, user_id, company, video_embed) FROM stdin;
\.


--
-- Data for Name: users_groupextend; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY users_groupextend (id, slug, group_id, ranking) FROM stdin;
1	dn-master	1	100
2	departamento-nacional	2	98
3	dr-master	3	96
4	departamento-regional	4	94
5	especialistas	5	92
6	profissionais-referencia	6	90
\.


--
-- Data for Name: users_historicaluser; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY users_historicaluser (id, password, last_login, is_superuser, email, is_active, is_staff, date_add, history_id, history_date, history_change_reason, history_type, history_user_id, user_id, name_first) FROM stdin;
1		\N	f	guilherme.marques+0@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.412174+00	1	2017-11-18 02:51:01.416301+00	\N	+	\N	\N	DN Master
1	pbkdf2_sha256$36000$Y56c3x7LAKIO$I87UJggHuoEF7ivdZkF4rijoqww4+WiJAgMZ03RJvnU=	\N	f	guilherme.marques+0@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.412174+00	2	2017-11-18 02:51:01.472881+00	\N	~	\N	\N	DN Master
2		\N	f	guilherme.marques+1@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.484768+00	3	2017-11-18 02:51:01.485238+00	\N	+	\N	\N	Departamento Nacional
2	pbkdf2_sha256$36000$zLJnTaAzIUDh$xGybKY82Xao3eTjMR/ViB9yEHz+dIr1/au1eTfQz3WY=	\N	f	guilherme.marques+1@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.484768+00	4	2017-11-18 02:51:01.526477+00	\N	~	\N	\N	Departamento Nacional
3		\N	f	guilherme.marques+2@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.545024+00	5	2017-11-18 02:51:01.545533+00	\N	+	\N	\N	DR Master
3	pbkdf2_sha256$36000$UQsmStKCv2jm$8PnFKZ5ghIu443tiyfwLNhi8MHzGO68K/ebS3slKERw=	\N	f	guilherme.marques+2@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.545024+00	6	2017-11-18 02:51:01.585828+00	\N	~	\N	\N	DR Master
4		\N	f	guilherme.marques+3@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.597838+00	7	2017-11-18 02:51:01.598398+00	\N	+	\N	\N	Departamento Regional
4	pbkdf2_sha256$36000$YwHvuFSeliWK$ZGPsSNpSJwM+9HAF8mjLN0Sma0OwjrFyy/8sHWj9aoE=	\N	f	guilherme.marques+3@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.597838+00	8	2017-11-18 02:51:01.643001+00	\N	~	\N	\N	Departamento Regional
5		\N	f	guilherme.marques+4@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.654733+00	9	2017-11-18 02:51:01.655243+00	\N	+	\N	\N	Especialistas
5	pbkdf2_sha256$36000$yyMs7p39Ui5Z$dgN8TOnMWSiTlaYN+1uG8GrlNcR7XArfdLDmCWlCzQg=	\N	f	guilherme.marques+4@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.654733+00	10	2017-11-18 02:51:01.694046+00	\N	~	\N	\N	Especialistas
6		\N	f	guilherme.marques+5@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.705482+00	11	2017-11-18 02:51:01.705971+00	\N	+	\N	\N	Profissionais Referência
6	pbkdf2_sha256$36000$ygosB5TAQmZT$qDNA7nnPhY+uEfhJdGqUnf4v8SJAQyOAxhFPu/+TBZQ=	\N	f	guilherme.marques+5@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.705482+00	12	2017-11-18 02:51:01.746948+00	\N	~	\N	\N	Profissionais Referência
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY users_user (id, password, last_login, is_superuser, email, is_active, is_staff, date_add, user_id, name_first) FROM stdin;
1	pbkdf2_sha256$36000$Y56c3x7LAKIO$I87UJggHuoEF7ivdZkF4rijoqww4+WiJAgMZ03RJvnU=	\N	f	guilherme.marques+0@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.412174+00	\N	DN Master
2	pbkdf2_sha256$36000$zLJnTaAzIUDh$xGybKY82Xao3eTjMR/ViB9yEHz+dIr1/au1eTfQz3WY=	\N	f	guilherme.marques+1@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.484768+00	\N	Departamento Nacional
3	pbkdf2_sha256$36000$UQsmStKCv2jm$8PnFKZ5ghIu443tiyfwLNhi8MHzGO68K/ebS3slKERw=	\N	f	guilherme.marques+2@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.545024+00	\N	DR Master
4	pbkdf2_sha256$36000$YwHvuFSeliWK$ZGPsSNpSJwM+9HAF8mjLN0Sma0OwjrFyy/8sHWj9aoE=	\N	f	guilherme.marques+3@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.597838+00	\N	Departamento Regional
5	pbkdf2_sha256$36000$yyMs7p39Ui5Z$dgN8TOnMWSiTlaYN+1uG8GrlNcR7XArfdLDmCWlCzQg=	\N	f	guilherme.marques+4@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.654733+00	\N	Especialistas
6	pbkdf2_sha256$36000$ygosB5TAQmZT$qDNA7nnPhY+uEfhJdGqUnf4v8SJAQyOAxhFPu/+TBZQ=	\N	f	guilherme.marques+5@thegoodfellas.com.br	t	f	2017-11-18 02:51:01.705482+00	\N	Profissionais Referência
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY users_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: inovacao_sesi
--

COPY users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: adjustments_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('adjustments_adjustments_id_seq', 1, false);


--
-- Name: audience_agerange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_agerange_id_seq', 1, false);


--
-- Name: audience_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_entity_id_seq', 1, false);


--
-- Name: audience_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_genre_id_seq', 1, false);


--
-- Name: audience_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_level_id_seq', 1, false);


--
-- Name: audience_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_region_id_seq', 1, false);


--
-- Name: audience_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('audience_type_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('auth_group_id_seq', 6, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 96, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('auth_permission_id_seq', 227, true);


--
-- Name: buying_companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('buying_companies_company_id_seq', 1, false);


--
-- Name: buying_companies_regional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('buying_companies_regional_id_seq', 1, false);


--
-- Name: communication_strategy_competitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_competitor_id_seq', 1, false);


--
-- Name: communication_strategy_competitor_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_competitor_market_id_seq', 1, false);


--
-- Name: communication_strategy_competitorincome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_competitorincome_id_seq', 1, false);


--
-- Name: communication_strategy_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_file_id_seq', 1, false);


--
-- Name: communication_strategy_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_resource_id_seq', 1, false);


--
-- Name: communication_strategy_resourcetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_resourcetype_id_seq', 1, false);


--
-- Name: communication_strategy_strategy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('communication_strategy_strategy_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('django_content_type_id_seq', 67, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('django_migrations_id_seq', 217, true);


--
-- Name: evaluations_drafts_evaluationdraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_drafts_evaluationdraft_id_seq', 1, false);


--
-- Name: evaluations_drafts_specialistevaluationdraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_drafts_specialistevaluationdraft_id_seq', 1, false);


--
-- Name: evaluations_evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_evaluation_id_seq', 1, false);


--
-- Name: evaluations_invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_invites_id_seq', 1, false);


--
-- Name: evaluations_resultevaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_resultevaluation_id_seq', 1, false);


--
-- Name: evaluations_specialistevaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_specialistevaluation_id_seq', 1, false);


--
-- Name: evaluations_stepevaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evaluations_stepevaluation_id_seq', 1, false);


--
-- Name: evidences_evidence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('evidences_evidence_id_seq', 1, false);


--
-- Name: execution_plan_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('execution_plan_step_id_seq', 1, false);


--
-- Name: expenses_and_revenues_cost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('expenses_and_revenues_cost_id_seq', 1, false);


--
-- Name: expenses_and_revenues_costtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('expenses_and_revenues_costtype_id_seq', 1, false);


--
-- Name: expenses_and_revenues_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('expenses_and_revenues_income_id_seq', 1, false);


--
-- Name: expenses_and_revenues_incometype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('expenses_and_revenues_incometype_id_seq', 1, false);


--
-- Name: expenses_and_revenues_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('expenses_and_revenues_value_id_seq', 1, false);


--
-- Name: faq_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('faq_faq_id_seq', 1, false);


--
-- Name: geodata_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('geodata_city_id_seq', 5571, false);


--
-- Name: geodata_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('geodata_country_id_seq', 2, false);


--
-- Name: geodata_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('geodata_state_id_seq', 28, false);


--
-- Name: marketing_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_company_id_seq', 1, false);


--
-- Name: marketing_pilotcompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_pilotcompany_id_seq', 1, false);


--
-- Name: marketing_pilotcompanycontact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_pilotcompanycontact_id_seq', 1, false);


--
-- Name: marketing_pilotresults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_pilotresults_id_seq', 1, false);


--
-- Name: marketing_technologytransfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_technologytransfer_id_seq', 1, false);


--
-- Name: marketing_unlistedreferencefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('marketing_unlistedreferencefile_id_seq', 1, false);


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('profiles_profile_id_seq', 6, true);


--
-- Name: received_messages_receivedmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('received_messages_receivedmessage_id_seq', 1, false);


--
-- Name: references_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('references_reference_id_seq', 1, false);


--
-- Name: references_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('references_type_id_seq', 2, true);


--
-- Name: results_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('results_result_id_seq', 1, false);


--
-- Name: results_resulttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('results_resulttype_id_seq', 1, false);


--
-- Name: solutions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_action_id_seq', 3, true);


--
-- Name: solutions_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_category_id_seq', 9, true);


--
-- Name: solutions_contactrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_contactrequest_id_seq', 1, false);


--
-- Name: solutions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_region_id_seq', 1, false);


--
-- Name: solutions_segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_segment_id_seq', 18, true);


--
-- Name: solutions_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_size_id_seq', 4, true);


--
-- Name: solutions_solution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_solution_id_seq', 1, false);


--
-- Name: solutions_solutionstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_solutionstatus_id_seq', 1, false);


--
-- Name: solutions_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('solutions_status_id_seq', 7, true);


--
-- Name: surveys_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('surveys_answer_id_seq', 1, false);


--
-- Name: surveys_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('surveys_question_id_seq', 1, false);


--
-- Name: surveys_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('surveys_survey_id_seq', 1, false);


--
-- Name: surveys_useranswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('surveys_useranswer_id_seq', 1, false);


--
-- Name: testimonials_testimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('testimonials_testimonial_id_seq', 1, false);


--
-- Name: users_groupextend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('users_groupextend_id_seq', 6, true);


--
-- Name: users_historicaluser_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('users_historicaluser_history_id_seq', 12, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('users_user_groups_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('users_user_id_seq', 6, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inovacao_sesi
--

SELECT pg_catalog.setval('users_user_user_permissions_id_seq', 1, false);


--
-- Name: adjustments_adjustments adjustments_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY adjustments_adjustments
    ADD CONSTRAINT adjustments_adjustments_pkey PRIMARY KEY (id);


--
-- Name: audience_agerange audience_agerange_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_agerange
    ADD CONSTRAINT audience_agerange_pkey PRIMARY KEY (id);


--
-- Name: audience_agerange audience_agerange_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_agerange
    ADD CONSTRAINT audience_agerange_slug_key UNIQUE (slug);


--
-- Name: audience_entity audience_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_pkey PRIMARY KEY (id);


--
-- Name: audience_genre audience_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_genre
    ADD CONSTRAINT audience_genre_pkey PRIMARY KEY (id);


--
-- Name: audience_genre audience_genre_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_genre
    ADD CONSTRAINT audience_genre_slug_key UNIQUE (slug);


--
-- Name: audience_level audience_level_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_level
    ADD CONSTRAINT audience_level_pkey PRIMARY KEY (id);


--
-- Name: audience_level audience_level_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_level
    ADD CONSTRAINT audience_level_slug_key UNIQUE (slug);


--
-- Name: audience_region audience_region_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_region
    ADD CONSTRAINT audience_region_pkey PRIMARY KEY (id);


--
-- Name: audience_region audience_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_region
    ADD CONSTRAINT audience_region_slug_key UNIQUE (slug);


--
-- Name: audience_type audience_type_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_type
    ADD CONSTRAINT audience_type_pkey PRIMARY KEY (id);


--
-- Name: audience_type audience_type_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_type
    ADD CONSTRAINT audience_type_slug_key UNIQUE (slug);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: buying_companies_company buying_companies_company_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_company_pkey PRIMARY KEY (id);


--
-- Name: buying_companies_regional buying_companies_regional_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_regional
    ADD CONSTRAINT buying_companies_regional_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_competitor_market communication_strategy_c_competitor_id_state_id_9f45206a_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor_market
    ADD CONSTRAINT communication_strategy_c_competitor_id_state_id_9f45206a_uniq UNIQUE (competitor_id, state_id);


--
-- Name: communication_strategy_competitor_market communication_strategy_competitor_market_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor_market
    ADD CONSTRAINT communication_strategy_competitor_market_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_competitor communication_strategy_competitor_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor
    ADD CONSTRAINT communication_strategy_competitor_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_competitorincome communication_strategy_competitorincome_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitorincome
    ADD CONSTRAINT communication_strategy_competitorincome_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_competitorincome communication_strategy_competitorincome_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitorincome
    ADD CONSTRAINT communication_strategy_competitorincome_slug_key UNIQUE (slug);


--
-- Name: communication_strategy_file communication_strategy_file_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_file
    ADD CONSTRAINT communication_strategy_file_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_resource communication_strategy_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resource
    ADD CONSTRAINT communication_strategy_resource_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_resourcetype communication_strategy_resourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resourcetype
    ADD CONSTRAINT communication_strategy_resourcetype_pkey PRIMARY KEY (id);


--
-- Name: communication_strategy_strategy communication_strategy_strategy_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_strategy
    ADD CONSTRAINT communication_strategy_strategy_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: evaluations_drafts_evaluationdraft evaluations_drafts_evaluationdraft_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_evaluationdraft
    ADD CONSTRAINT evaluations_drafts_evaluationdraft_pkey PRIMARY KEY (id);


--
-- Name: evaluations_drafts_specialistevaluationdraft evaluations_drafts_specialistevaluationdraft_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_specialistevaluationdraft
    ADD CONSTRAINT evaluations_drafts_specialistevaluationdraft_pkey PRIMARY KEY (id);


--
-- Name: evaluations_evaluation evaluations_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_evaluation
    ADD CONSTRAINT evaluations_evaluation_pkey PRIMARY KEY (id);


--
-- Name: evaluations_invites evaluations_invites_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_invites
    ADD CONSTRAINT evaluations_invites_pkey PRIMARY KEY (id);


--
-- Name: evaluations_invites evaluations_invites_user_id_solution_id_237c3fd6_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_invites
    ADD CONSTRAINT evaluations_invites_user_id_solution_id_237c3fd6_uniq UNIQUE (user_id, solution_id);


--
-- Name: evaluations_resultevaluation evaluations_resultevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation
    ADD CONSTRAINT evaluations_resultevaluation_pkey PRIMARY KEY (id);


--
-- Name: evaluations_specialistevaluation evaluations_specialistevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_specialistevaluation
    ADD CONSTRAINT evaluations_specialistevaluation_pkey PRIMARY KEY (id);


--
-- Name: evaluations_stepevaluation evaluations_stepevaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation
    ADD CONSTRAINT evaluations_stepevaluation_pkey PRIMARY KEY (id);


--
-- Name: evidences_evidence evidences_evidence_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evidences_evidence
    ADD CONSTRAINT evidences_evidence_pkey PRIMARY KEY (id);


--
-- Name: execution_plan_step execution_plan_step_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY execution_plan_step
    ADD CONSTRAINT execution_plan_step_pkey PRIMARY KEY (id);


--
-- Name: expenses_and_revenues_cost expenses_and_revenues_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_cost
    ADD CONSTRAINT expenses_and_revenues_cost_pkey PRIMARY KEY (id);


--
-- Name: expenses_and_revenues_costtype expenses_and_revenues_costtype_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_costtype
    ADD CONSTRAINT expenses_and_revenues_costtype_pkey PRIMARY KEY (id);


--
-- Name: expenses_and_revenues_revenue expenses_and_revenues_income_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenue
    ADD CONSTRAINT expenses_and_revenues_income_pkey PRIMARY KEY (id);


--
-- Name: expenses_and_revenues_revenuetype expenses_and_revenues_incometype_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenuetype
    ADD CONSTRAINT expenses_and_revenues_incometype_pkey PRIMARY KEY (id);


--
-- Name: expenses_and_revenues_value expenses_and_revenues_value_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_value
    ADD CONSTRAINT expenses_and_revenues_value_pkey PRIMARY KEY (id);


--
-- Name: faq_faq faq_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY faq_faq
    ADD CONSTRAINT faq_faq_pkey PRIMARY KEY (id);


--
-- Name: geodata_city geodata_city_code_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_city
    ADD CONSTRAINT geodata_city_code_key UNIQUE (code);


--
-- Name: geodata_city geodata_city_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_city
    ADD CONSTRAINT geodata_city_pkey PRIMARY KEY (id);


--
-- Name: geodata_country geodata_country_code_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_country
    ADD CONSTRAINT geodata_country_code_key UNIQUE (code);


--
-- Name: geodata_country geodata_country_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_country
    ADD CONSTRAINT geodata_country_pkey PRIMARY KEY (id);


--
-- Name: geodata_state geodata_state_code_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_state
    ADD CONSTRAINT geodata_state_code_key UNIQUE (code);


--
-- Name: geodata_state geodata_state_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_state
    ADD CONSTRAINT geodata_state_pkey PRIMARY KEY (id);


--
-- Name: marketing_company marketing_company_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_company
    ADD CONSTRAINT marketing_company_pkey PRIMARY KEY (id);


--
-- Name: marketing_pilotcompany marketing_pilotcompany_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany
    ADD CONSTRAINT marketing_pilotcompany_pkey PRIMARY KEY (id);


--
-- Name: marketing_pilotcompanycontact marketing_pilotcompanycontact_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompanycontact
    ADD CONSTRAINT marketing_pilotcompanycontact_pkey PRIMARY KEY (id);


--
-- Name: marketing_pilotresults marketing_pilotresults_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotresults
    ADD CONSTRAINT marketing_pilotresults_pkey PRIMARY KEY (id);


--
-- Name: marketing_technologytransfer marketing_technologytransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_technologytransfer
    ADD CONSTRAINT marketing_technologytransfer_pkey PRIMARY KEY (id);


--
-- Name: marketing_unlistedreferencefile marketing_unlistedreferencefile_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_unlistedreferencefile
    ADD CONSTRAINT marketing_unlistedreferencefile_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_key UNIQUE (user_id);


--
-- Name: received_messages_receivedmessage received_messages_receivedmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY received_messages_receivedmessage
    ADD CONSTRAINT received_messages_receivedmessage_pkey PRIMARY KEY (id);


--
-- Name: references_reference references_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_reference
    ADD CONSTRAINT references_reference_pkey PRIMARY KEY (id);


--
-- Name: references_type references_type_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_type
    ADD CONSTRAINT references_type_pkey PRIMARY KEY (id);


--
-- Name: results_result results_result_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result
    ADD CONSTRAINT results_result_pkey PRIMARY KEY (id);


--
-- Name: results_resulttype results_resulttype_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_resulttype
    ADD CONSTRAINT results_resulttype_pkey PRIMARY KEY (id);


--
-- Name: solutions_action solutions_action_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action
    ADD CONSTRAINT solutions_action_pkey PRIMARY KEY (id);


--
-- Name: solutions_action solutions_action_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action
    ADD CONSTRAINT solutions_action_slug_key UNIQUE (slug);


--
-- Name: solutions_category solutions_category_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_category
    ADD CONSTRAINT solutions_category_pkey PRIMARY KEY (id);


--
-- Name: solutions_contactrequest solutions_contactrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_contactrequest
    ADD CONSTRAINT solutions_contactrequest_pkey PRIMARY KEY (id);


--
-- Name: solutions_region solutions_region_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_region
    ADD CONSTRAINT solutions_region_pkey PRIMARY KEY (id);


--
-- Name: solutions_segment solutions_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_segment
    ADD CONSTRAINT solutions_segment_pkey PRIMARY KEY (id);


--
-- Name: solutions_size solutions_size_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_size
    ADD CONSTRAINT solutions_size_pkey PRIMARY KEY (id);


--
-- Name: solutions_solution solutions_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_pkey PRIMARY KEY (id);


--
-- Name: solutions_solution solutions_solution_slug_6366928d_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_slug_6366928d_uniq UNIQUE (slug);


--
-- Name: solutions_solutionstatus solutions_solutionstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solutionstatus
    ADD CONSTRAINT solutions_solutionstatus_pkey PRIMARY KEY (id);


--
-- Name: solutions_status solutions_status_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_status
    ADD CONSTRAINT solutions_status_pkey PRIMARY KEY (id);


--
-- Name: solutions_status solutions_status_slug_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_status
    ADD CONSTRAINT solutions_status_slug_key UNIQUE (slug);


--
-- Name: surveys_answer surveys_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_answer
    ADD CONSTRAINT surveys_answer_pkey PRIMARY KEY (id);


--
-- Name: surveys_question surveys_question_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_question
    ADD CONSTRAINT surveys_question_pkey PRIMARY KEY (id);


--
-- Name: surveys_survey surveys_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_survey
    ADD CONSTRAINT surveys_survey_pkey PRIMARY KEY (id);


--
-- Name: surveys_useranswer surveys_useranswer_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_useranswer
    ADD CONSTRAINT surveys_useranswer_pkey PRIMARY KEY (id);


--
-- Name: testimonials_testimonial testimonials_testimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY testimonials_testimonial
    ADD CONSTRAINT testimonials_testimonial_pkey PRIMARY KEY (id);


--
-- Name: users_groupextend users_groupextend_group_id_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_groupextend
    ADD CONSTRAINT users_groupextend_group_id_key UNIQUE (group_id);


--
-- Name: users_groupextend users_groupextend_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_groupextend
    ADD CONSTRAINT users_groupextend_pkey PRIMARY KEY (id);


--
-- Name: users_historicaluser users_historicaluser_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_historicaluser
    ADD CONSTRAINT users_historicaluser_pkey PRIMARY KEY (history_id);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: adjustments_adjustments_solution_id_0faf39bf; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX adjustments_adjustments_solution_id_0faf39bf ON adjustments_adjustments USING btree (solution_id);


--
-- Name: adjustments_adjustments_user_id_e16bfe46; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX adjustments_adjustments_user_id_e16bfe46 ON adjustments_adjustments USING btree (user_id);


--
-- Name: audience_agerange_slug_866b4e67_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_agerange_slug_866b4e67_like ON audience_agerange USING btree (slug varchar_pattern_ops);


--
-- Name: audience_entity_region_id_8ef655f6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_region_id_8ef655f6 ON audience_entity USING btree (region_id);


--
-- Name: audience_entity_segment_id_fd24b940; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_segment_id_fd24b940 ON audience_entity USING btree (segment_id);


--
-- Name: audience_entity_size_id_c3dc541f; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_size_id_c3dc541f ON audience_entity USING btree (size_id);


--
-- Name: audience_entity_solution_id_430dfbac; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_solution_id_430dfbac ON audience_entity USING btree (solution_id);


--
-- Name: audience_entity_state_id_1f071284; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_state_id_1f071284 ON audience_entity USING btree (state_id);


--
-- Name: audience_entity_user_id_2b45899c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_entity_user_id_2b45899c ON audience_entity USING btree (user_id);


--
-- Name: audience_genre_slug_95cea05d_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_genre_slug_95cea05d_like ON audience_genre USING btree (slug varchar_pattern_ops);


--
-- Name: audience_level_slug_b620d536_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_level_slug_b620d536_like ON audience_level USING btree (slug varchar_pattern_ops);


--
-- Name: audience_region_slug_24d5c172_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_region_slug_24d5c172_like ON audience_region USING btree (slug varchar_pattern_ops);


--
-- Name: audience_type_slug_c044e4ca_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX audience_type_slug_c044e4ca_like ON audience_type USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: buying_companies_company_segment_id_0c44de71; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_company_segment_id_0c44de71 ON buying_companies_company USING btree (segment_id);


--
-- Name: buying_companies_company_size_id_f4af3e87; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_company_size_id_f4af3e87 ON buying_companies_company USING btree (size_id);


--
-- Name: buying_companies_company_solution_id_2dfad20f; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_company_solution_id_2dfad20f ON buying_companies_company USING btree (solution_id);


--
-- Name: buying_companies_company_state_id_17349ff8; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_company_state_id_17349ff8 ON buying_companies_company USING btree (state_id);


--
-- Name: buying_companies_company_user_id_b8d3f9ca; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_company_user_id_b8d3f9ca ON buying_companies_company USING btree (user_id);


--
-- Name: buying_companies_regional_solution_id_c3327ecd; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_regional_solution_id_c3327ecd ON buying_companies_regional USING btree (solution_id);


--
-- Name: buying_companies_regional_state_id_2de2470b; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_regional_state_id_2de2470b ON buying_companies_regional USING btree (state_id);


--
-- Name: buying_companies_regional_user_id_22bd870a; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX buying_companies_regional_user_id_22bd870a ON buying_companies_regional USING btree (user_id);


--
-- Name: communication_strategy_competitor_city_id_60bdc65f; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_city_id_60bdc65f ON communication_strategy_competitor USING btree (city_id);


--
-- Name: communication_strategy_competitor_income_id_a4b7991e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_income_id_a4b7991e ON communication_strategy_competitor USING btree (income_id);


--
-- Name: communication_strategy_competitor_market_competitor_id_7f997b46; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_market_competitor_id_7f997b46 ON communication_strategy_competitor_market USING btree (competitor_id);


--
-- Name: communication_strategy_competitor_market_state_id_a4ff8c56; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_market_state_id_a4ff8c56 ON communication_strategy_competitor_market USING btree (state_id);


--
-- Name: communication_strategy_competitor_solution_id_0fcdc75d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_solution_id_0fcdc75d ON communication_strategy_competitor USING btree (solution_id);


--
-- Name: communication_strategy_competitor_user_id_7ffa3a2a; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitor_user_id_7ffa3a2a ON communication_strategy_competitor USING btree (user_id);


--
-- Name: communication_strategy_competitorincome_slug_6d864126_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_competitorincome_slug_6d864126_like ON communication_strategy_competitorincome USING btree (slug varchar_pattern_ops);


--
-- Name: communication_strategy_file_solution_id_421b3646; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_file_solution_id_421b3646 ON communication_strategy_file USING btree (solution_id);


--
-- Name: communication_strategy_file_user_id_f9dabecb; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_file_user_id_f9dabecb ON communication_strategy_file USING btree (user_id);


--
-- Name: communication_strategy_resource_solution_id_b1d78680; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_resource_solution_id_b1d78680 ON communication_strategy_resource USING btree (solution_id);


--
-- Name: communication_strategy_resource_type_id_ebdd6f0d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_resource_type_id_ebdd6f0d ON communication_strategy_resource USING btree (type_id);


--
-- Name: communication_strategy_resource_user_id_6cdac776; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_resource_user_id_6cdac776 ON communication_strategy_resource USING btree (user_id);


--
-- Name: communication_strategy_resourcetype_slug_ae6fb538; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_resourcetype_slug_ae6fb538 ON communication_strategy_resourcetype USING btree (slug);


--
-- Name: communication_strategy_resourcetype_slug_ae6fb538_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_resourcetype_slug_ae6fb538_like ON communication_strategy_resourcetype USING btree (slug varchar_pattern_ops);


--
-- Name: communication_strategy_strategy_solution_id_db4a736e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_strategy_solution_id_db4a736e ON communication_strategy_strategy USING btree (solution_id);


--
-- Name: communication_strategy_strategy_user_id_752079ed; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX communication_strategy_strategy_user_id_752079ed ON communication_strategy_strategy USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: evaluations_drafts_evaluationdraft_solution_id_fc830f3f; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_drafts_evaluationdraft_solution_id_fc830f3f ON evaluations_drafts_evaluationdraft USING btree (solution_id);


--
-- Name: evaluations_drafts_evaluationdraft_user_id_7662dce8; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_drafts_evaluationdraft_user_id_7662dce8 ON evaluations_drafts_evaluationdraft USING btree (user_id);


--
-- Name: evaluations_drafts_special_solution_id_3fa01e93; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_drafts_special_solution_id_3fa01e93 ON evaluations_drafts_specialistevaluationdraft USING btree (solution_id);


--
-- Name: evaluations_drafts_specialistevaluationdraft_user_id_1dcf6ce7; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_drafts_specialistevaluationdraft_user_id_1dcf6ce7 ON evaluations_drafts_specialistevaluationdraft USING btree (user_id);


--
-- Name: evaluations_evaluation_solution_id_666cd574; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_evaluation_solution_id_666cd574 ON evaluations_evaluation USING btree (solution_id);


--
-- Name: evaluations_evaluation_user_id_69cd2e6f; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_evaluation_user_id_69cd2e6f ON evaluations_evaluation USING btree (user_id);


--
-- Name: evaluations_invites_solution_id_09cbfb29; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_invites_solution_id_09cbfb29 ON evaluations_invites USING btree (solution_id);


--
-- Name: evaluations_invites_user_id_9b41aff6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_invites_user_id_9b41aff6 ON evaluations_invites USING btree (user_id);


--
-- Name: evaluations_resultevaluati_specialist_evaluation_draf_d094202c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_resultevaluati_specialist_evaluation_draf_d094202c ON evaluations_resultevaluation USING btree (specialist_evaluation_draft_id);


--
-- Name: evaluations_resultevaluation_result_id_bc71338d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_resultevaluation_result_id_bc71338d ON evaluations_resultevaluation USING btree (result_id);


--
-- Name: evaluations_resultevaluation_specialist_evaluation_id_b39eab11; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_resultevaluation_specialist_evaluation_id_b39eab11 ON evaluations_resultevaluation USING btree (specialist_evaluation_id);


--
-- Name: evaluations_resultevaluation_user_id_d714a0e6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_resultevaluation_user_id_d714a0e6 ON evaluations_resultevaluation USING btree (user_id);


--
-- Name: evaluations_specialistevaluation_solution_id_6a2cbfc6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_specialistevaluation_solution_id_6a2cbfc6 ON evaluations_specialistevaluation USING btree (solution_id);


--
-- Name: evaluations_specialistevaluation_user_id_446d9d9a; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_specialistevaluation_user_id_446d9d9a ON evaluations_specialistevaluation USING btree (user_id);


--
-- Name: evaluations_stepevaluation_specialist_evaluation_draf_a631cfac; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_stepevaluation_specialist_evaluation_draf_a631cfac ON evaluations_stepevaluation USING btree (specialist_evaluation_draft_id);


--
-- Name: evaluations_stepevaluation_specialist_evaluation_id_6ee33190; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_stepevaluation_specialist_evaluation_id_6ee33190 ON evaluations_stepevaluation USING btree (specialist_evaluation_id);


--
-- Name: evaluations_stepevaluation_step_id_fb131479; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_stepevaluation_step_id_fb131479 ON evaluations_stepevaluation USING btree (step_id);


--
-- Name: evaluations_stepevaluation_user_id_0910f79b; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evaluations_stepevaluation_user_id_0910f79b ON evaluations_stepevaluation USING btree (user_id);


--
-- Name: evidences_evidence_content_type_id_04fcb38a; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evidences_evidence_content_type_id_04fcb38a ON evidences_evidence USING btree (content_type_id);


--
-- Name: evidences_evidence_user_id_7219fce9; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX evidences_evidence_user_id_7219fce9 ON evidences_evidence USING btree (user_id);


--
-- Name: execution_plan_step_slug_fdc65447; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX execution_plan_step_slug_fdc65447 ON execution_plan_step USING btree (slug);


--
-- Name: execution_plan_step_slug_fdc65447_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX execution_plan_step_slug_fdc65447_like ON execution_plan_step USING btree (slug varchar_pattern_ops);


--
-- Name: execution_plan_step_solution_id_2a7f11d0; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX execution_plan_step_solution_id_2a7f11d0 ON execution_plan_step USING btree (solution_id);


--
-- Name: execution_plan_step_user_id_a7fa2b43; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX execution_plan_step_user_id_a7fa2b43 ON execution_plan_step USING btree (user_id);


--
-- Name: expenses_and_revenues_cost_solution_id_c2117ede; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_cost_solution_id_c2117ede ON expenses_and_revenues_cost USING btree (solution_id);


--
-- Name: expenses_and_revenues_cost_type_id_31487ad3; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_cost_type_id_31487ad3 ON expenses_and_revenues_cost USING btree (type_id);


--
-- Name: expenses_and_revenues_cost_user_id_ed11a191; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_cost_user_id_ed11a191 ON expenses_and_revenues_cost USING btree (user_id);


--
-- Name: expenses_and_revenues_costtype_slug_4ca12e75; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_costtype_slug_4ca12e75 ON expenses_and_revenues_costtype USING btree (slug);


--
-- Name: expenses_and_revenues_costtype_slug_4ca12e75_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_costtype_slug_4ca12e75_like ON expenses_and_revenues_costtype USING btree (slug varchar_pattern_ops);


--
-- Name: expenses_and_revenues_income_solution_id_4587589e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_income_solution_id_4587589e ON expenses_and_revenues_revenue USING btree (solution_id);


--
-- Name: expenses_and_revenues_income_type_id_7f25651c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_income_type_id_7f25651c ON expenses_and_revenues_revenue USING btree (type_id);


--
-- Name: expenses_and_revenues_income_user_id_114881ff; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_income_user_id_114881ff ON expenses_and_revenues_revenue USING btree (user_id);


--
-- Name: expenses_and_revenues_incometype_slug_48958f84; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_incometype_slug_48958f84 ON expenses_and_revenues_revenuetype USING btree (slug);


--
-- Name: expenses_and_revenues_incometype_slug_48958f84_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_incometype_slug_48958f84_like ON expenses_and_revenues_revenuetype USING btree (slug varchar_pattern_ops);


--
-- Name: expenses_and_revenues_value_solution_id_df4eba53; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_value_solution_id_df4eba53 ON expenses_and_revenues_value USING btree (solution_id);


--
-- Name: expenses_and_revenues_value_user_id_a043954e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX expenses_and_revenues_value_user_id_a043954e ON expenses_and_revenues_value USING btree (user_id);


--
-- Name: geodata_city_code_2ecf0972_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX geodata_city_code_2ecf0972_like ON geodata_city USING btree (code varchar_pattern_ops);


--
-- Name: geodata_city_state_id_2e18ed0e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX geodata_city_state_id_2e18ed0e ON geodata_city USING btree (state_id);


--
-- Name: geodata_country_code_79ab2727_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX geodata_country_code_79ab2727_like ON geodata_country USING btree (code varchar_pattern_ops);


--
-- Name: geodata_state_code_5340c050_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX geodata_state_code_5340c050_like ON geodata_state USING btree (code varchar_pattern_ops);


--
-- Name: geodata_state_country_id_acbf2d66; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX geodata_state_country_id_acbf2d66 ON geodata_state USING btree (country_id);


--
-- Name: marketing_company_segment_id_6f9f4ecd; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_company_segment_id_6f9f4ecd ON marketing_company USING btree (segment_id);


--
-- Name: marketing_company_solution_id_254b6d2b; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_company_solution_id_254b6d2b ON marketing_company USING btree (solution_id);


--
-- Name: marketing_company_state_id_608275f6; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_company_state_id_608275f6 ON marketing_company USING btree (state_id);


--
-- Name: marketing_pilotcompany_segment_id_82c28e66; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotcompany_segment_id_82c28e66 ON marketing_pilotcompany USING btree (segment_id);


--
-- Name: marketing_pilotcompany_size_id_c4f13e37; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotcompany_size_id_c4f13e37 ON marketing_pilotcompany USING btree (size_id);


--
-- Name: marketing_pilotcompany_solution_id_29474ef5; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotcompany_solution_id_29474ef5 ON marketing_pilotcompany USING btree (solution_id);


--
-- Name: marketing_pilotcompany_state_id_f954e7ac; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotcompany_state_id_f954e7ac ON marketing_pilotcompany USING btree (state_id);


--
-- Name: marketing_pilotcompanycontact_pilot_company_id_a5d5e351; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotcompanycontact_pilot_company_id_a5d5e351 ON marketing_pilotcompanycontact USING btree (pilot_company_id);


--
-- Name: marketing_pilotresults_pilot_company_id_5e1fe687; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_pilotresults_pilot_company_id_5e1fe687 ON marketing_pilotresults USING btree (pilot_company_id);


--
-- Name: marketing_technologytransfer_solution_id_fb8493f8; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_technologytransfer_solution_id_fb8493f8 ON marketing_technologytransfer USING btree (solution_id);


--
-- Name: marketing_unlistedreferencefile_solution_id_29e623ba; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX marketing_unlistedreferencefile_solution_id_29e623ba ON marketing_unlistedreferencefile USING btree (solution_id);


--
-- Name: profiles_profile_category_id_d2c62791; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX profiles_profile_category_id_d2c62791 ON profiles_profile USING btree (category_id);


--
-- Name: profiles_profile_regional_id_35ca2285; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX profiles_profile_regional_id_35ca2285 ON profiles_profile USING btree (regional_id);


--
-- Name: received_messages_receivedmessage_category_id_6737ea6c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX received_messages_receivedmessage_category_id_6737ea6c ON received_messages_receivedmessage USING btree (category_id);


--
-- Name: received_messages_receivedmessage_state_id_e16c8734; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX received_messages_receivedmessage_state_id_e16c8734 ON received_messages_receivedmessage USING btree (state_id);


--
-- Name: references_reference_solution_id_d8a5a795; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX references_reference_solution_id_d8a5a795 ON references_reference USING btree (solution_id);


--
-- Name: references_reference_type_id_4c89f8f4; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX references_reference_type_id_4c89f8f4 ON references_reference USING btree (type_id);


--
-- Name: references_reference_user_id_7f290695; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX references_reference_user_id_7f290695 ON references_reference USING btree (user_id);


--
-- Name: references_type_slug_aae67147; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX references_type_slug_aae67147 ON references_type USING btree (slug);


--
-- Name: references_type_slug_aae67147_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX references_type_slug_aae67147_like ON references_type USING btree (slug varchar_pattern_ops);


--
-- Name: results_result_solution_id_8fdc1641; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_result_solution_id_8fdc1641 ON results_result USING btree (solution_id);


--
-- Name: results_result_step_id_505b7cdf; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_result_step_id_505b7cdf ON results_result USING btree (step_id);


--
-- Name: results_result_type_id_7811bf8b; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_result_type_id_7811bf8b ON results_result USING btree (type_id);


--
-- Name: results_result_user_id_ed3178a5; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_result_user_id_ed3178a5 ON results_result USING btree (user_id);


--
-- Name: results_resulttype_slug_eded4c55; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_resulttype_slug_eded4c55 ON results_resulttype USING btree (slug);


--
-- Name: results_resulttype_slug_eded4c55_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX results_resulttype_slug_eded4c55_like ON results_resulttype USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_action_next_status_id_5a76d08d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_action_next_status_id_5a76d08d ON solutions_action USING btree (next_status_id);


--
-- Name: solutions_action_permission_id_b4204e8c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_action_permission_id_b4204e8c ON solutions_action USING btree (permission_id);


--
-- Name: solutions_action_slug_4f770d9f_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_action_slug_4f770d9f_like ON solutions_action USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_action_status_id_8bda98bb; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_action_status_id_8bda98bb ON solutions_action USING btree (status_id);


--
-- Name: solutions_category_slug_81fb3085; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_category_slug_81fb3085 ON solutions_category USING btree (slug);


--
-- Name: solutions_category_slug_81fb3085_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_category_slug_81fb3085_like ON solutions_category USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_contactrequest_solution_id_49391e51; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_contactrequest_solution_id_49391e51 ON solutions_contactrequest USING btree (solution_id);


--
-- Name: solutions_contactrequest_uf_id_655171d7; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_contactrequest_uf_id_655171d7 ON solutions_contactrequest USING btree (uf_id);


--
-- Name: solutions_region_slug_a15d8f13; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_region_slug_a15d8f13 ON solutions_region USING btree (slug);


--
-- Name: solutions_region_slug_a15d8f13_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_region_slug_a15d8f13_like ON solutions_region USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_segment_slug_08330d8e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_segment_slug_08330d8e ON solutions_segment USING btree (slug);


--
-- Name: solutions_segment_slug_08330d8e_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_segment_slug_08330d8e_like ON solutions_segment USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_size_slug_fe4bd1a3; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_size_slug_fe4bd1a3 ON solutions_size USING btree (slug);


--
-- Name: solutions_size_slug_fe4bd1a3_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_size_slug_fe4bd1a3_like ON solutions_size USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_solution_category_id_3063b629; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solution_category_id_3063b629 ON solutions_solution USING btree (category_id);


--
-- Name: solutions_solution_segments_id_9612002c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solution_segments_id_9612002c ON solutions_solution USING btree (segment_id);


--
-- Name: solutions_solution_sizes_id_12a0344d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solution_sizes_id_12a0344d ON solutions_solution USING btree (size_id);


--
-- Name: solutions_solution_slug_6366928d_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solution_slug_6366928d_like ON solutions_solution USING btree (slug varchar_pattern_ops);


--
-- Name: solutions_solution_user_id_ab2ce018; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solution_user_id_ab2ce018 ON solutions_solution USING btree (user_id);


--
-- Name: solutions_solutionstatus_solution_id_1b7a00e0; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solutionstatus_solution_id_1b7a00e0 ON solutions_solutionstatus USING btree (solution_id);


--
-- Name: solutions_solutionstatus_status_id_b1182e49; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solutionstatus_status_id_b1182e49 ON solutions_solutionstatus USING btree (status_id);


--
-- Name: solutions_solutionstatus_user_id_efb78a07; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_solutionstatus_user_id_efb78a07 ON solutions_solutionstatus USING btree (user_id);


--
-- Name: solutions_status_next_status_id_9fad271d; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_status_next_status_id_9fad271d ON solutions_status USING btree (next_status_id);


--
-- Name: solutions_status_slug_19cb119a_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX solutions_status_slug_19cb119a_like ON solutions_status USING btree (slug varchar_pattern_ops);


--
-- Name: surveys_answer_question_id_c0166f3c; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX surveys_answer_question_id_c0166f3c ON surveys_answer USING btree (question_id);


--
-- Name: surveys_survey_solution_id_ceb795fc; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX surveys_survey_solution_id_ceb795fc ON surveys_survey USING btree (solution_id);


--
-- Name: surveys_survey_user_id_51628b94; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX surveys_survey_user_id_51628b94 ON surveys_survey USING btree (user_id);


--
-- Name: surveys_useranswer_answer_id_8d198cd5; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX surveys_useranswer_answer_id_8d198cd5 ON surveys_useranswer USING btree (answer_id);


--
-- Name: surveys_useranswer_survey_id_baf33137; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX surveys_useranswer_survey_id_baf33137 ON surveys_useranswer USING btree (survey_id);


--
-- Name: testimonials_testimonial_solution_id_135b9ebc; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX testimonials_testimonial_solution_id_135b9ebc ON testimonials_testimonial USING btree (solution_id);


--
-- Name: testimonials_testimonial_user_id_a3406265; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX testimonials_testimonial_user_id_a3406265 ON testimonials_testimonial USING btree (user_id);


--
-- Name: users_groupextend_slug_a7126111; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_groupextend_slug_a7126111 ON users_groupextend USING btree (slug);


--
-- Name: users_groupextend_slug_a7126111_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_groupextend_slug_a7126111_like ON users_groupextend USING btree (slug varchar_pattern_ops);


--
-- Name: users_historicaluser_email_a7c70263; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_historicaluser_email_a7c70263 ON users_historicaluser USING btree (email);


--
-- Name: users_historicaluser_email_a7c70263_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_historicaluser_email_a7c70263_like ON users_historicaluser USING btree (email varchar_pattern_ops);


--
-- Name: users_historicaluser_history_user_id_7f91d047; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_historicaluser_history_user_id_7f91d047 ON users_historicaluser USING btree (history_user_id);


--
-- Name: users_historicaluser_id_5e70dd03; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_historicaluser_id_5e70dd03 ON users_historicaluser USING btree (id);


--
-- Name: users_historicaluser_user_id_ef8ca2f5; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_historicaluser_user_id_ef8ca2f5 ON users_historicaluser USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_email_243f6e77_like ON users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON users_user_groups USING btree (user_id);


--
-- Name: users_user_user_id_4120b7b9; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_user_id_4120b7b9 ON users_user USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: inovacao_sesi
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON users_user_user_permissions USING btree (user_id);


--
-- Name: adjustments_adjustments adjustments_adjustme_solution_id_0faf39bf_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY adjustments_adjustments
    ADD CONSTRAINT adjustments_adjustme_solution_id_0faf39bf_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adjustments_adjustments adjustments_adjustments_user_id_e16bfe46_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY adjustments_adjustments
    ADD CONSTRAINT adjustments_adjustments_user_id_e16bfe46_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_region_id_8ef655f6_fk_audience_region_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_region_id_8ef655f6_fk_audience_region_id FOREIGN KEY (region_id) REFERENCES audience_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_segment_id_fd24b940_fk_solutions_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_segment_id_fd24b940_fk_solutions_segment_id FOREIGN KEY (segment_id) REFERENCES solutions_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_size_id_c3dc541f_fk_solutions_size_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_size_id_c3dc541f_fk_solutions_size_id FOREIGN KEY (size_id) REFERENCES solutions_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_solution_id_430dfbac_fk_solutions_solution_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_solution_id_430dfbac_fk_solutions_solution_id FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_state_id_1f071284_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_state_id_1f071284_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audience_entity audience_entity_user_id_2b45899c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY audience_entity
    ADD CONSTRAINT audience_entity_user_id_2b45899c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_company buying_companies_com_segment_id_0c44de71_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_com_segment_id_0c44de71_fk_solutions FOREIGN KEY (segment_id) REFERENCES solutions_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_company buying_companies_com_solution_id_2dfad20f_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_com_solution_id_2dfad20f_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_company buying_companies_company_size_id_f4af3e87_fk_solutions_size_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_company_size_id_f4af3e87_fk_solutions_size_id FOREIGN KEY (size_id) REFERENCES solutions_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_company buying_companies_company_state_id_17349ff8_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_company_state_id_17349ff8_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_company buying_companies_company_user_id_b8d3f9ca_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_company
    ADD CONSTRAINT buying_companies_company_user_id_b8d3f9ca_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_regional buying_companies_reg_solution_id_c3327ecd_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_regional
    ADD CONSTRAINT buying_companies_reg_solution_id_c3327ecd_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_regional buying_companies_regional_state_id_2de2470b_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_regional
    ADD CONSTRAINT buying_companies_regional_state_id_2de2470b_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: buying_companies_regional buying_companies_regional_user_id_22bd870a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY buying_companies_regional
    ADD CONSTRAINT buying_companies_regional_user_id_22bd870a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor communication_strate_city_id_60bdc65f_fk_geodata_c; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor
    ADD CONSTRAINT communication_strate_city_id_60bdc65f_fk_geodata_c FOREIGN KEY (city_id) REFERENCES geodata_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor_market communication_strate_competitor_id_7f997b46_fk_communica; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor_market
    ADD CONSTRAINT communication_strate_competitor_id_7f997b46_fk_communica FOREIGN KEY (competitor_id) REFERENCES communication_strategy_competitor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor communication_strate_income_id_a4b7991e_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor
    ADD CONSTRAINT communication_strate_income_id_a4b7991e_fk_solutions FOREIGN KEY (income_id) REFERENCES solutions_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor communication_strate_solution_id_0fcdc75d_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor
    ADD CONSTRAINT communication_strate_solution_id_0fcdc75d_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_file communication_strate_solution_id_421b3646_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_file
    ADD CONSTRAINT communication_strate_solution_id_421b3646_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_resource communication_strate_solution_id_b1d78680_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resource
    ADD CONSTRAINT communication_strate_solution_id_b1d78680_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_strategy communication_strate_solution_id_db4a736e_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_strategy
    ADD CONSTRAINT communication_strate_solution_id_db4a736e_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor_market communication_strate_state_id_a4ff8c56_fk_geodata_s; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor_market
    ADD CONSTRAINT communication_strate_state_id_a4ff8c56_fk_geodata_s FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_resource communication_strate_type_id_ebdd6f0d_fk_communica; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resource
    ADD CONSTRAINT communication_strate_type_id_ebdd6f0d_fk_communica FOREIGN KEY (type_id) REFERENCES communication_strategy_resourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_resource communication_strate_user_id_6cdac776_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_resource
    ADD CONSTRAINT communication_strate_user_id_6cdac776_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_strategy communication_strate_user_id_752079ed_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_strategy
    ADD CONSTRAINT communication_strate_user_id_752079ed_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_competitor communication_strate_user_id_7ffa3a2a_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_competitor
    ADD CONSTRAINT communication_strate_user_id_7ffa3a2a_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_strategy_file communication_strategy_file_user_id_f9dabecb_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY communication_strategy_file
    ADD CONSTRAINT communication_strategy_file_user_id_f9dabecb_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_drafts_evaluationdraft evaluations_drafts_e_solution_id_fc830f3f_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_evaluationdraft
    ADD CONSTRAINT evaluations_drafts_e_solution_id_fc830f3f_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_drafts_evaluationdraft evaluations_drafts_e_user_id_7662dce8_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_evaluationdraft
    ADD CONSTRAINT evaluations_drafts_e_user_id_7662dce8_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_drafts_specialistevaluationdraft evaluations_drafts_s_solution_id_3fa01e93_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_specialistevaluationdraft
    ADD CONSTRAINT evaluations_drafts_s_solution_id_3fa01e93_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_drafts_specialistevaluationdraft evaluations_drafts_s_user_id_1dcf6ce7_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_drafts_specialistevaluationdraft
    ADD CONSTRAINT evaluations_drafts_s_user_id_1dcf6ce7_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_evaluation evaluations_evaluati_solution_id_666cd574_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_evaluation
    ADD CONSTRAINT evaluations_evaluati_solution_id_666cd574_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_evaluation evaluations_evaluation_user_id_69cd2e6f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_evaluation
    ADD CONSTRAINT evaluations_evaluation_user_id_69cd2e6f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_invites evaluations_invites_solution_id_09cbfb29_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_invites
    ADD CONSTRAINT evaluations_invites_solution_id_09cbfb29_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_invites evaluations_invites_user_id_9b41aff6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_invites
    ADD CONSTRAINT evaluations_invites_user_id_9b41aff6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_resultevaluation evaluations_resultev_result_id_bc71338d_fk_results_r; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation
    ADD CONSTRAINT evaluations_resultev_result_id_bc71338d_fk_results_r FOREIGN KEY (result_id) REFERENCES results_result(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_resultevaluation evaluations_resultev_specialist_evaluatio_b39eab11_fk_evaluatio; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation
    ADD CONSTRAINT evaluations_resultev_specialist_evaluatio_b39eab11_fk_evaluatio FOREIGN KEY (specialist_evaluation_id) REFERENCES evaluations_specialistevaluation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_resultevaluation evaluations_resultev_specialist_evaluatio_d094202c_fk_evaluatio; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation
    ADD CONSTRAINT evaluations_resultev_specialist_evaluatio_d094202c_fk_evaluatio FOREIGN KEY (specialist_evaluation_draft_id) REFERENCES evaluations_drafts_specialistevaluationdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_resultevaluation evaluations_resultevaluation_user_id_d714a0e6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_resultevaluation
    ADD CONSTRAINT evaluations_resultevaluation_user_id_d714a0e6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_specialistevaluation evaluations_speciali_solution_id_6a2cbfc6_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_specialistevaluation
    ADD CONSTRAINT evaluations_speciali_solution_id_6a2cbfc6_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_specialistevaluation evaluations_speciali_user_id_446d9d9a_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_specialistevaluation
    ADD CONSTRAINT evaluations_speciali_user_id_446d9d9a_fk_users_use FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_stepevaluation evaluations_stepeval_specialist_evaluatio_6ee33190_fk_evaluatio; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation
    ADD CONSTRAINT evaluations_stepeval_specialist_evaluatio_6ee33190_fk_evaluatio FOREIGN KEY (specialist_evaluation_id) REFERENCES evaluations_specialistevaluation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_stepevaluation evaluations_stepeval_specialist_evaluatio_a631cfac_fk_evaluatio; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation
    ADD CONSTRAINT evaluations_stepeval_specialist_evaluatio_a631cfac_fk_evaluatio FOREIGN KEY (specialist_evaluation_draft_id) REFERENCES evaluations_drafts_specialistevaluationdraft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_stepevaluation evaluations_stepeval_step_id_fb131479_fk_execution; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation
    ADD CONSTRAINT evaluations_stepeval_step_id_fb131479_fk_execution FOREIGN KEY (step_id) REFERENCES execution_plan_step(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evaluations_stepevaluation evaluations_stepevaluation_user_id_0910f79b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evaluations_stepevaluation
    ADD CONSTRAINT evaluations_stepevaluation_user_id_0910f79b_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evidences_evidence evidences_evidence_content_type_id_04fcb38a_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evidences_evidence
    ADD CONSTRAINT evidences_evidence_content_type_id_04fcb38a_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evidences_evidence evidences_evidence_user_id_7219fce9_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY evidences_evidence
    ADD CONSTRAINT evidences_evidence_user_id_7219fce9_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: execution_plan_step execution_plan_step_solution_id_2a7f11d0_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY execution_plan_step
    ADD CONSTRAINT execution_plan_step_solution_id_2a7f11d0_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: execution_plan_step execution_plan_step_user_id_a7fa2b43_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY execution_plan_step
    ADD CONSTRAINT execution_plan_step_user_id_a7fa2b43_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_revenue expenses_and_revenue_solution_id_4587589e_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenue
    ADD CONSTRAINT expenses_and_revenue_solution_id_4587589e_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_cost expenses_and_revenue_solution_id_c2117ede_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_cost
    ADD CONSTRAINT expenses_and_revenue_solution_id_c2117ede_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_value expenses_and_revenue_solution_id_df4eba53_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_value
    ADD CONSTRAINT expenses_and_revenue_solution_id_df4eba53_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_cost expenses_and_revenue_type_id_31487ad3_fk_expenses_; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_cost
    ADD CONSTRAINT expenses_and_revenue_type_id_31487ad3_fk_expenses_ FOREIGN KEY (type_id) REFERENCES expenses_and_revenues_costtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_revenue expenses_and_revenue_type_id_bdc3a072_fk_expenses_; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenue
    ADD CONSTRAINT expenses_and_revenue_type_id_bdc3a072_fk_expenses_ FOREIGN KEY (type_id) REFERENCES expenses_and_revenues_revenuetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_cost expenses_and_revenues_cost_user_id_ed11a191_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_cost
    ADD CONSTRAINT expenses_and_revenues_cost_user_id_ed11a191_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_revenue expenses_and_revenues_income_user_id_114881ff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_revenue
    ADD CONSTRAINT expenses_and_revenues_income_user_id_114881ff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_and_revenues_value expenses_and_revenues_value_user_id_a043954e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY expenses_and_revenues_value
    ADD CONSTRAINT expenses_and_revenues_value_user_id_a043954e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geodata_city geodata_city_state_id_2e18ed0e_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_city
    ADD CONSTRAINT geodata_city_state_id_2e18ed0e_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geodata_state geodata_state_country_id_acbf2d66_fk_geodata_country_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY geodata_state
    ADD CONSTRAINT geodata_state_country_id_acbf2d66_fk_geodata_country_id FOREIGN KEY (country_id) REFERENCES geodata_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_company marketing_company_segment_id_6f9f4ecd_fk_solutions_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_company
    ADD CONSTRAINT marketing_company_segment_id_6f9f4ecd_fk_solutions_segment_id FOREIGN KEY (segment_id) REFERENCES solutions_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_company marketing_company_solution_id_254b6d2b_fk_solutions_solution_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_company
    ADD CONSTRAINT marketing_company_solution_id_254b6d2b_fk_solutions_solution_id FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_company marketing_company_state_id_608275f6_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_company
    ADD CONSTRAINT marketing_company_state_id_608275f6_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotcompanycontact marketing_pilotcompa_pilot_company_id_a5d5e351_fk_marketing; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompanycontact
    ADD CONSTRAINT marketing_pilotcompa_pilot_company_id_a5d5e351_fk_marketing FOREIGN KEY (pilot_company_id) REFERENCES marketing_pilotcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotcompany marketing_pilotcompa_segment_id_82c28e66_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany
    ADD CONSTRAINT marketing_pilotcompa_segment_id_82c28e66_fk_solutions FOREIGN KEY (segment_id) REFERENCES solutions_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotcompany marketing_pilotcompa_solution_id_29474ef5_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany
    ADD CONSTRAINT marketing_pilotcompa_solution_id_29474ef5_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotcompany marketing_pilotcompany_size_id_c4f13e37_fk_solutions_size_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany
    ADD CONSTRAINT marketing_pilotcompany_size_id_c4f13e37_fk_solutions_size_id FOREIGN KEY (size_id) REFERENCES solutions_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotcompany marketing_pilotcompany_state_id_f954e7ac_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotcompany
    ADD CONSTRAINT marketing_pilotcompany_state_id_f954e7ac_fk_geodata_state_id FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_pilotresults marketing_pilotresul_pilot_company_id_5e1fe687_fk_marketing; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_pilotresults
    ADD CONSTRAINT marketing_pilotresul_pilot_company_id_5e1fe687_fk_marketing FOREIGN KEY (pilot_company_id) REFERENCES marketing_pilotcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_technologytransfer marketing_technology_solution_id_fb8493f8_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_technologytransfer
    ADD CONSTRAINT marketing_technology_solution_id_fb8493f8_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketing_unlistedreferencefile marketing_unlistedre_solution_id_29e623ba_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY marketing_unlistedreferencefile
    ADD CONSTRAINT marketing_unlistedre_solution_id_29e623ba_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_category_id_d2c62791_fk_solutions_category_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_category_id_d2c62791_fk_solutions_category_id FOREIGN KEY (category_id) REFERENCES solutions_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_regional_id_35ca2285_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_regional_id_35ca2285_fk_geodata_state_id FOREIGN KEY (regional_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: received_messages_receivedmessage received_messages_re_category_id_6737ea6c_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY received_messages_receivedmessage
    ADD CONSTRAINT received_messages_re_category_id_6737ea6c_fk_solutions FOREIGN KEY (category_id) REFERENCES solutions_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: received_messages_receivedmessage received_messages_re_state_id_e16c8734_fk_geodata_s; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY received_messages_receivedmessage
    ADD CONSTRAINT received_messages_re_state_id_e16c8734_fk_geodata_s FOREIGN KEY (state_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: references_reference references_reference_solution_id_d8a5a795_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_reference
    ADD CONSTRAINT references_reference_solution_id_d8a5a795_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: references_reference references_reference_type_id_4c89f8f4_fk_references_type_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_reference
    ADD CONSTRAINT references_reference_type_id_4c89f8f4_fk_references_type_id FOREIGN KEY (type_id) REFERENCES references_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: references_reference references_reference_user_id_7f290695_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY references_reference
    ADD CONSTRAINT references_reference_user_id_7f290695_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: results_result results_result_solution_id_8fdc1641_fk_solutions_solution_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result
    ADD CONSTRAINT results_result_solution_id_8fdc1641_fk_solutions_solution_id FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: results_result results_result_step_id_505b7cdf_fk_execution_plan_step_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result
    ADD CONSTRAINT results_result_step_id_505b7cdf_fk_execution_plan_step_id FOREIGN KEY (step_id) REFERENCES execution_plan_step(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: results_result results_result_type_id_7811bf8b_fk_results_resulttype_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result
    ADD CONSTRAINT results_result_type_id_7811bf8b_fk_results_resulttype_id FOREIGN KEY (type_id) REFERENCES results_resulttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: results_result results_result_user_id_ed3178a5_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY results_result
    ADD CONSTRAINT results_result_user_id_ed3178a5_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_action solutions_action_next_status_id_5a76d08d_fk_solutions_status_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action
    ADD CONSTRAINT solutions_action_next_status_id_5a76d08d_fk_solutions_status_id FOREIGN KEY (next_status_id) REFERENCES solutions_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_action solutions_action_permission_id_b4204e8c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action
    ADD CONSTRAINT solutions_action_permission_id_b4204e8c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_action solutions_action_status_id_8bda98bb_fk_solutions_status_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_action
    ADD CONSTRAINT solutions_action_status_id_8bda98bb_fk_solutions_status_id FOREIGN KEY (status_id) REFERENCES solutions_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_contactrequest solutions_contactreq_solution_id_49391e51_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_contactrequest
    ADD CONSTRAINT solutions_contactreq_solution_id_49391e51_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_contactrequest solutions_contactrequest_uf_id_655171d7_fk_geodata_state_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_contactrequest
    ADD CONSTRAINT solutions_contactrequest_uf_id_655171d7_fk_geodata_state_id FOREIGN KEY (uf_id) REFERENCES geodata_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solution solutions_solution_category_id_3063b629_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_category_id_3063b629_fk_solutions FOREIGN KEY (category_id) REFERENCES solutions_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solution solutions_solution_segment_id_ae9b258c_fk_solutions_segment_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_segment_id_ae9b258c_fk_solutions_segment_id FOREIGN KEY (segment_id) REFERENCES solutions_segment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solution solutions_solution_size_id_fb8357f4_fk_solutions_size_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_size_id_fb8357f4_fk_solutions_size_id FOREIGN KEY (size_id) REFERENCES solutions_size(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solution solutions_solution_user_id_ab2ce018_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solution
    ADD CONSTRAINT solutions_solution_user_id_ab2ce018_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solutionstatus solutions_solutionst_solution_id_1b7a00e0_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solutionstatus
    ADD CONSTRAINT solutions_solutionst_solution_id_1b7a00e0_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solutionstatus solutions_solutionst_status_id_b1182e49_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solutionstatus
    ADD CONSTRAINT solutions_solutionst_status_id_b1182e49_fk_solutions FOREIGN KEY (status_id) REFERENCES solutions_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_solutionstatus solutions_solutionstatus_user_id_efb78a07_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_solutionstatus
    ADD CONSTRAINT solutions_solutionstatus_user_id_efb78a07_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solutions_status solutions_status_next_status_id_9fad271d_fk_solutions_status_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY solutions_status
    ADD CONSTRAINT solutions_status_next_status_id_9fad271d_fk_solutions_status_id FOREIGN KEY (next_status_id) REFERENCES solutions_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveys_answer surveys_answer_question_id_c0166f3c_fk_surveys_question_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_answer
    ADD CONSTRAINT surveys_answer_question_id_c0166f3c_fk_surveys_question_id FOREIGN KEY (question_id) REFERENCES surveys_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveys_survey surveys_survey_solution_id_ceb795fc_fk_solutions_solution_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_survey
    ADD CONSTRAINT surveys_survey_solution_id_ceb795fc_fk_solutions_solution_id FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveys_survey surveys_survey_user_id_51628b94_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_survey
    ADD CONSTRAINT surveys_survey_user_id_51628b94_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveys_useranswer surveys_useranswer_answer_id_8d198cd5_fk_surveys_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_useranswer
    ADD CONSTRAINT surveys_useranswer_answer_id_8d198cd5_fk_surveys_answer_id FOREIGN KEY (answer_id) REFERENCES surveys_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveys_useranswer surveys_useranswer_survey_id_baf33137_fk_surveys_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY surveys_useranswer
    ADD CONSTRAINT surveys_useranswer_survey_id_baf33137_fk_surveys_survey_id FOREIGN KEY (survey_id) REFERENCES surveys_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: testimonials_testimonial testimonials_testimo_solution_id_135b9ebc_fk_solutions; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY testimonials_testimonial
    ADD CONSTRAINT testimonials_testimo_solution_id_135b9ebc_fk_solutions FOREIGN KEY (solution_id) REFERENCES solutions_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: testimonials_testimonial testimonials_testimonial_user_id_a3406265_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY testimonials_testimonial
    ADD CONSTRAINT testimonials_testimonial_user_id_a3406265_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_groupextend users_groupextend_group_id_37934242_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_groupextend
    ADD CONSTRAINT users_groupextend_group_id_37934242_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_historicaluser users_historicaluser_history_user_id_7f91d047_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_historicaluser
    ADD CONSTRAINT users_historicaluser_history_user_id_7f91d047_fk_users_user_id FOREIGN KEY (history_user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user users_user_user_id_4120b7b9_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_user_id_4120b7b9_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: inovacao_sesi
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

