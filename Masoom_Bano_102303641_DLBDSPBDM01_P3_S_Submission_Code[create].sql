/*CREATE DATABASE airbnb_project;*/

BEGIN;

-- CREATE STATEMENTS FOR THE AIRBNB DATABASE: START HERE:
CREATE TABLE IF NOT EXISTS host(
    host_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    location_id character varying(10) NOT NULL,
    payout_id character varying(10) NOT NULL,
    refund_id character varying(10) NOT NULL,
    msg_id character varying(10) NOT NULL,
    id_verify character varying(10) NOT NULL,
    review_id character varying(10) NOT NULL,
    rating_id character varying(10) NOT NULL,
    published_guides character varying(10),
    guide_for_host character varying(10) NOT NULL,
    coupon_id character varying(10) NOT NULL,
    giftcard_id character varying(10) NOT NULL,
    policy_id character varying(10) NOT NULL,
    rules_id character varying(10) NOT NULL,
    cancel_id character varying(10) NOT NULL,
    receipt_id character varying(10) NOT NULL,
    host_email character varying(100) NOT NULL,
    host_password character varying(8) NOT NULL,
    host_name character(100) NOT NULL,
    host_since date NOT NULL,
    host_profile_pic bytea,
    host_phone_no numeric(12) NOT NULL,
    is_super_host boolean NOT NULL,
    host_address character varying(1000) NOT NULL,
    PRIMARY KEY (host_id)
);

CREATE TABLE IF NOT EXISTS guest(
    guest_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    location_id character varying(10) NOT NULL,
    msg_id character varying(10) NOT NULL,
    id_verify character varying(10) NOT NULL,
    rating_id character varying(10) NOT NULL,
    review_id character varying(10) NOT NULL,
    guide_for_guest character varying(10) NOT NULL,
    policy_id character varying(10) NOT NULL,
    rule_id character varying(10) NOT NULL,
    coupon_id character varying(10) NOT NULL,
    giftcard_id character varying(10) NOT NULL,
    refund_id character varying(10) NOT NULL,
    cancel_id character varying(10) NOT NULL,
    payment_id character varying(10) NOT NULL,
    receipt_id character varying(10) NOT NULL,
    guest_name character(100) NOT NULL,
    guest_email character varying(100) NOT NULL,
    guest_password character varying(8) NOT NULL,
    guest_phone_no numeric(12) NOT NULL,
    guest_profile_pic bytea NOT NULL,
    guest_address character varying(100) NOT NULL,
    guest_since date NOT NULL,
    PRIMARY KEY (guest_id)
);

CREATE TABLE IF NOT EXISTS listing(
    listing_id character varying(10) NOT NULL,
    host_id character varying(10) NOT NULL,
    rules_id character varying(10) NOT NULL,
    location_id character varying(10) NOT NULL,
    rating_id character varying(10) NOT NULL,
    policy_id character varying(10) NOT NULL,
    review_id character varying(10) NOT NULL,
    listing_avail character varying NOT NULL,
    amenities_id character varying(10) NOT NULL,
    listing_name character(100) NOT NULL,
    listing_pic1 bytea NOT NULL,
    listing_pic2 bytea NOT NULL,
    listing_pic3 bytea NOT NULL,
    listing_pic4 bytea NOT NULL,
    listing_description text NOT NULL,
    price_per_night_in_euro double precision NOT NULL,
    listing_address character varying(100) NOT NULL,
    posted_date date NOT NULL,
    is_guest_favourite boolean NOT NULL,
    is_security_deposit boolean NOT NULL,
    security_deposit_amt double precision,
    PRIMARY KEY (listing_id)
);

CREATE TABLE IF NOT EXISTS rating(
    rating_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    rating_category character varying(100) NOT NULL,
    overall_rating numeric(5) NOT NULL,
    rating_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS review(
    review_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    review_added text NOT NULL,
    review_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS region(
    region_id character varying(10) NOT NULL,
    region_name character varying(100) NOT NULL,
    PRIMARY KEY (region_id)
);

CREATE TABLE IF NOT EXISTS country(
    country_id character varying(10) NOT NULL,
    region_id character varying(10) NOT NULL,
    country_name character(100) NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE IF NOT EXISTS city(
    city_id character varying(10) NOT NULL,
    country_id character varying(10) NOT NULL,
    city_name character(100) NOT NULL,
    PRIMARY KEY (city_id)
);

CREATE TABLE IF NOT EXISTS location(
    location_id character varying(10) NOT NULL,
    neighborhood_id character varying(10) NOT NULL,
    location_name character(100) NOT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE IF NOT EXISTS neighborhood(
    neighborhood_id character varying(10) NOT NULL,
    city_id character varying(10) NOT NULL,
    neighborhood_name character(100) NOT NULL,
    PRIMARY KEY (neighborhood_id)
);

CREATE TABLE IF NOT EXISTS payouts(
    payout_id character varying(10) NOT NULL,
    payout_category character varying(20) NOT NULL,
    host_id character varying(10) NOT NULL,
    payout_date date NOT NULL,
    payout_status character varying(100) NOT NULL,
    payout_amt double precision NOT NULL,
    taxes_added double precision NOT NULL,
    total_payout_amt double precision NOT NULL,
    PRIMARY KEY (payout_id)
);

CREATE TABLE IF NOT EXISTS payments(
    payment_id character varying(10) NOT NULL,
    payment_category character varying(20) NOT NULL,
    guest_id character(10) NOT NULL,
    payment_date date NOT NULL,
    payment_status character varying(100) NOT NULL,
    payment_amt double precision NOT NULL,
    PRIMARY KEY (payment_id)
);

CREATE TABLE IF NOT EXISTS msg(
    msg_id character varying(10) NOT NULL,
    msg_text text NOT NULL,
    msg_time time without time zone NOT NULL
);

CREATE TABLE IF NOT EXISTS guide_book_for_host(
    guide_host_id character varying NOT NULL,
    guide_name character(100) NOT NULL,
    guide_published text NOT NULL,
    guide_category character varying(100) NOT NULL,
    PRIMARY KEY (guide_host_id)
);

CREATE TABLE IF NOT EXISTS guide_book_for_guest(
    guide_guest_id character varying(10) NOT NULL,
    guide_name character varying(100) NOT NULL,
    guide_published text NOT NULL,
    guide_category character varying(100) NOT NULL,
    PRIMARY KEY (guide_guest_id)
);

CREATE TABLE IF NOT EXISTS policy(
    policy_id character varying(10) NOT NULL,
    policy_name character(100) NOT NULL,
    policy_text text NOT NULL,
    PRIMARY KEY (policy_id)
);

CREATE TABLE IF NOT EXISTS rules(
    rules_id character varying(10) NOT NULL,
    rules_name character varying(100) NOT NULL,
    rules_text text NOT NULL,
    PRIMARY KEY (rules_id)
);

CREATE TABLE IF NOT EXISTS coupon(
    coupon_id character varying(10) NOT NULL,
    coupon_name character varying(100) NOT NULL,
    coupon_status character varying(100) NOT NULL,
    coupon_validity daterange NOT NULL,
    PRIMARY KEY (coupon_id)
);

CREATE TABLE IF NOT EXISTS giftcard(
    giftcard_id character varying(10) NOT NULL,
    giftcard_name character varying(100) NOT NULL,
    giftcard_status character varying(100) NOT NULL,
    giftcard_validity daterange NOT NULL,
    PRIMARY KEY (giftcard_id)
);

CREATE TABLE IF NOT EXISTS refund(
    refund_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    host_id character varying(10) NOT NULL,
    cancel_id character varying(10) NOT NULL,
    receipt_id character varying(10) NOT NULL,
    refund_date date NOT NULL,
    refund_status character varying NOT NULL
);

CREATE TABLE IF NOT EXISTS cancellation(
    cancel_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    host_id character varying(10),
    refund_id character varying(10) NOT NULL,
    receipt_id character varying(10) NOT NULL,
    cancel_reason character(100) NOT NULL,
    cancel_date date NOT NULL,
    cancel_status character(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS booking(
    booking_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    number_of_guests character varying(200) NOT NULL,
    number_of_pets character varying(20) NOT NULL,
    nightly_price double precision NOT NULL,
    staying_for character varying(20) NOT NULL,
    payable_amt double precision NOT NULL,
    pay_method character varying(20) NOT NULL,
    booking_date date NOT NULL,
    booking_status character varying(100) NOT NULL,
    security_deposit boolean NOT NULL,
    PRIMARY KEY (booking_id)
);

CREATE TABLE IF NOT EXISTS receipt(
    receipt_id character varying(10) NOT NULL,
    coupon_id character varying(10),
    giftcard_id character varying(10),
    booking_id character varying(10) NOT NULL,
    receipt_generation_date date NOT NULL,
    security_deposit double precision NOT NULL,
    booking_amt double precision NOT NULL,
    coupon_discount character varying(50) NOT NULL,
    giftcard_discount character varying(50) NOT NULL,
    cleaning_fee double precision NOT NULL,
    taxes_added double precision NOT NULL,
    total_amt double precision NOT NULL,
    discounted_amt double precision NOT NULL,
    security_deposit_status character varying(100) NOT NULL,
    booking_status character varying(100) NOT NULL,
    PRIMARY KEY (receipt_id)
);

CREATE TABLE IF NOT EXISTS listing_category(
    listing_category_id character varying(10) NOT NULL,
    category_name character(100) NOT NULL,
    PRIMARY KEY (listing_category_id)
);

CREATE TABLE IF NOT EXISTS wishlists(
    wishlist_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    wishlist_name character(100) NOT NULL,
    PRIMARY KEY (wishlist_id)
);

CREATE TABLE IF NOT EXISTS id_verification(
    id_verify character varying(10) NOT NULL,
    id_type_status character(100) NOT NULL,
    PRIMARY KEY (id_verify)
);

CREATE TABLE IF NOT EXISTS listing_avail(
    listing_avail_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    no_of_beds numeric(10) NOT NULL,
    no_of_bath numeric(10) NOT NULL,
    max_no_of_guest numeric(50) NOT NULL,
    guest_type character varying(50) NOT NULL,
    is_pets_allowed boolean NOT NULL,
    no_of_pets character varying(5),
    PRIMARY KEY (listing_avail_id)
);

CREATE TABLE IF NOT EXISTS saved_payment_methods(
    saved_pay_id character varying(10) NOT NULL,
    saved_pay_category character varying(100) NOT NULL,
    category_name character(100) NOT NULL,
    PRIMARY KEY (saved_pay_id)
);

CREATE TABLE IF NOT EXISTS admin(
    admin_id character varying(10) NOT NULL,
    host_id character varying(10) NOT NULL,
    guest_id character varying(10) NOT NULL,
    listing_id character varying(10) NOT NULL,
    id_verify character varying(10) NOT NULL,
    review_id character varying(10) NOT NULL,
    rating_id character varying(10) NOT NULL,
    receipt_id character varying(10) NOT NULL,
    booking_id character varying(10) NOT NULL,
    listing_avail character varying(10) NOT NULL,
    payout_id character varying(10) NOT NULL,
    payment_id character varying(10) NOT NULL,
    guide_for_host character varying(10) NOT NULL,
    guide_by_host character varying(10) NOT NULL,
    guide_for_guest character varying(10) NOT NULL,
    giftcard_id character varying(10) NOT NULL,
    coupon_id character varying(10) NOT NULL,
    cancel_id character varying(10) NOT NULL,
    refund_id character varying(10) NOT NULL,
    admin_email character varying(50) NOT NULL,
    admin_password character varying(8) NOT NULL,
    admin_name character(50) NOT NULL,
    admin_profile_pic bytea NOT NULL,
    designation character(100) NOT NULL,
    admin_address character varying(100) NOT NULL,
    admin_phone_no numeric(12) NOT NULL,
    joined_date date NOT NULL,
    PRIMARY KEY (admin_id)
);

CREATE TABLE IF NOT EXISTS rating_category(
    rating_category_id character varying(10) NOT NULL,
    category_name character(100) NOT NULL,
    PRIMARY KEY (rating_category_id)
);

CREATE TABLE IF NOT EXISTS guide_published_by_host(
	published_guide_id character varying(10) NOT NULL,
    host_id character varying(10) NOT NULL,
    guide_name character(100),
    published_guide text,
    published_date date,
    published_guide_category character varying(100),
    PRIMARY KEY (published_guide_id)
);

CREATE TABLE IF NOT EXISTS amenities(
    listing_id character varying(10) NOT NULL,
    amenities_id character varying(10) NOT NULL,
    listing_category_id text NOT NULL,
    amenities_category_id text NOT NULL,
    listing_avail_id character varying(50) NOT NULL,
    PRIMARY KEY (amenities_id)
);

CREATE TABLE IF NOT EXISTS amenities_categories(
    amenities_category_id character varying(10) NOT NULL,
    amenities_category_name character varying(100) NOT NULL,
    amenities_name text NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_number(
    rating_id character varying(10) NOT NULL,
    rating_number double precision NOT NULL
);

CREATE TABLE IF NOT EXISTS pay_category(
    pay_category_id character varying(10) NOT NULL,
    pay_category character(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS id_category(
	id_category_id character varying(10) NOT NULL,
    id_category_name character(100) NOT NULL,
	id_status character(100) NOT NULL
);
-- CREATE STATEMENTS FOR THE AIRBNB DATABASE: END HERE;


-- ALTER STATEMENTS FOR THE AIRBNB DATABASE: START HERE:
ALTER TABLE IF EXISTS host
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT location_id FOREIGN KEY (location_id)
    REFERENCES location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT payout_id FOREIGN KEY (payout_id)
    REFERENCES payouts (payout_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT published_guide_id FOREIGN KEY (published_guides)
    REFERENCES guide_published_by_host (published_guide_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT guide_for_host_id FOREIGN KEY (guide_for_host)
    REFERENCES guide_book_for_host (guide_host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT coupon_id FOREIGN KEY (coupon_id)
    REFERENCES coupon (coupon_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT giftcard_id FOREIGN KEY (giftcard_id)
    REFERENCES giftcard (giftcard_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT policy_id FOREIGN KEY (policy_id)
    REFERENCES policy (policy_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT rule_id FOREIGN KEY (rules_id)
    REFERENCES rules (rules_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	

ALTER TABLE IF EXISTS host
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS host
    ADD CONSTRAINT id_verify FOREIGN KEY (id_verify)
    REFERENCES id_verification (id_verify) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT location_id FOREIGN KEY (location_id)
    REFERENCES location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT guide_for_guest FOREIGN KEY (guide_for_guest)
    REFERENCES guide_book_for_guest (guide_guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT policy_id FOREIGN KEY (policy_id)
    REFERENCES policy (policy_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT rule_id FOREIGN KEY (rule_id)
    REFERENCES rules (rules_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT coupon_id FOREIGN KEY (coupon_id)
    REFERENCES coupon (coupon_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT giftcard_id FOREIGN KEY (giftcard_id)
    REFERENCES giftcard (giftcard_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT payment_id FOREIGN KEY (payment_id)
    REFERENCES payments (payment_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guest
    ADD CONSTRAINT id_verify FOREIGN KEY (id_verify)
    REFERENCES id_verification (id_verify) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT host_id FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT rule_id FOREIGN KEY (rules_id)
    REFERENCES rules (rules_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT location_id FOREIGN KEY (location_id)
    REFERENCES location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT policy_id FOREIGN KEY (policy_id)
    REFERENCES policy (policy_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT listing_avail_id FOREIGN KEY (listing_avail)
    REFERENCES listing_avail (listing_avail_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS listing
    ADD CONSTRAINT amenities_id FOREIGN KEY (amenities_id)
    REFERENCES amenities (amenities_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS rating
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS rating
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS rating
    ADD CONSTRAINT rating_category FOREIGN KEY (rating_category)
    REFERENCES rating_category (rating_category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS review
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS review
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS country
    ADD CONSTRAINT region_id FOREIGN KEY (region_id)
    REFERENCES region (region_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS city
    ADD CONSTRAINT country_id FOREIGN KEY (country_id)
    REFERENCES country (country_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS location
    ADD CONSTRAINT neighboorhood_id FOREIGN KEY (neighborhood_id)
    REFERENCES neighborhood (neighborhood_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS neighborhood
    ADD CONSTRAINT city_id FOREIGN KEY (city_id)
    REFERENCES city (city_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS payouts
    ADD CONSTRAINT host FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS payments
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS refund
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS refund
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS refund
    ADD CONSTRAINT host_id FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS refund
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS cancellation
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS cancellation
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS cancellation
    ADD CONSTRAINT host_id FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS cancellation
    ADD CONSTRAINT receipt FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS booking
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS booking
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS receipt
    ADD CONSTRAINT coupon_id FOREIGN KEY (coupon_id)
    REFERENCES coupon (coupon_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS receipt
    ADD CONSTRAINT giftcard_id FOREIGN KEY (giftcard_id)
    REFERENCES giftcard (giftcard_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS receipt
    ADD CONSTRAINT booking_id FOREIGN KEY (booking_id)
    REFERENCES booking (booking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS wishlists
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS wishlists
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


	ALTER TABLE IF EXISTS listing_avail
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS saved_payment_methods
    ADD CONSTRAINT saved_pay_id_for_host FOREIGN KEY (saved_pay_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS saved_payment_methods
    ADD CONSTRAINT saved_pay_id_for_guest FOREIGN KEY (saved_pay_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT host_id FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT guest_id FOREIGN KEY (guest_id)
    REFERENCES guest (guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT booking_id FOREIGN KEY (booking_id)
    REFERENCES booking (booking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT listing_avail_id FOREIGN KEY (listing_avail)
    REFERENCES listing_avail (listing_avail_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT payout_id FOREIGN KEY (payout_id)
    REFERENCES payouts (payout_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT payment_id FOREIGN KEY (payment_id)
    REFERENCES payments (payment_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT guide_by_host FOREIGN KEY (guide_by_host)
    REFERENCES guide_published_by_host (published_guide_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT guide_for_host FOREIGN KEY (guide_for_host)
    REFERENCES guide_book_for_host (guide_host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT giftcard_id FOREIGN KEY (giftcard_id)
    REFERENCES giftcard (giftcard_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT coupon_id FOREIGN KEY (coupon_id)
    REFERENCES coupon (coupon_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS admin
    ADD CONSTRAINT guide_for_guest FOREIGN KEY (guide_for_guest)
    REFERENCES guide_book_for_guest (guide_guest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS guide_published_by_host
    ADD CONSTRAINT host_id FOREIGN KEY (host_id)
    REFERENCES host (host_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

	
ALTER TABLE IF EXISTS amenities
    ADD CONSTRAINT listing_id FOREIGN KEY (listing_id)
    REFERENCES listing (listing_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS amenities
    ADD CONSTRAINT listing_category_id FOREIGN KEY (listing_category_id)
    REFERENCES listing_category (listing_category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS amenities
    ADD FOREIGN KEY (listing_avail_id)
    REFERENCES listing_avail (listing_avail_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
-- ALTER STATEMENTS FOR THE AIRBNB DATABASE: END HERE;


-- INSERT STATEMENTS FOR THE AIRBNB DATABASE: START HERE:

/*Insert statement[20] for host table*/
INSERT INTO host
VALUES('H001', 'L001', 'LO001', 'PO001', 'RF001', 'MSG00h1', 'IDVF00h1','REID001', 'RAID001', 'PGID001', 'GFH001', 'CC001', 'GC001', 'P001', 'R001', 'CAN001', 'REC001', 'sara.lindholm@postse.se', 's@lind12', 'Sara Lindholm', '2018-03-11', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_1.png'), 46701234567, True, 'Drottninggatan 68, 111 21 Stockholm, Sweden'),
('H002', 'L002', 'LO002', 'PO002', 'RF002', 'MSG00h2', 'IDVF00h2','REID002', 'RAID002', 'PGID002', 'GFH002', 'CC002', 'GC002', 'P002', 'R002', 'CAN002', 'REC002', 'oliver.smith@gmail.com', 'Oly_sth8', 'Oliver Smith', '2017-09-25', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_2.png'), 447700900123, False, '15 High Rd, Manchester, M20 2YY, UK'),
('H003', 'L003', 'LO003', 'PO003', 'RF003', 'MSG00h3', 'IDVF00h3','REID003', 'RAID003', 'PGID003', 'GFH003', 'CC003', 'GC003', 'P003', 'R003', 'CAN003', 'REC003', 'chinedu_okafor@gmail.com', 'ok@for34', 'Chinedu Okafor', '2019-09-16', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_3.png'), 9876543210, True, '8 MG Rd, Bengaluru, 560001, India'),
('H004', 'L004', 'LO004', 'PO004', 'RF004', 'MSG00h4', 'IDVF00h4','REID004', 'RAID004', 'PGID004', 'GFH004', 'CC004', 'GC004', 'P004', 'R004', 'CAN004', 'REC004', 'amina_hassan@gmail.com', 'amina234', 'Amina Hassan', '2020-03-17', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_4.png'), 48056543210, True, '15 Moi Ave, Nairobi, Kenya'),
('H005', 'L005', 'LO005', 'PO005', 'RF005', 'MSG00h5', 'IDVF00h5','REID005', 'RAID005', 'PGID005', 'GFH005', 'CC005', 'GC005', 'P005', 'R005', 'CAN005', 'REC005', 'reddy_sun3040@outlook.com', 'suntia@3', 'Sunita Reddy', '2025-03-11', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_5.png'), 9987654321, False, '21 Jubilee Hills, Hyderabad, India'),
('H006', 'L006', 'LO006', 'PO006', 'RF006', 'MSG00h6', 'IDVF00h6','REID006', 'RAID006', 'PGID006', 'GFH006', 'CC006', 'GC006', 'P006', 'R006', 'CAN006', 'REC006', 'francisco_g12@mail.com', 'gomez*79', 'Francisco Gomez', '2018-10-10', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_6.png'), 612345678, False, 'Gran Vía 42, 28013 Madrid, Spain'),
('H007', 'L007', 'LO007', 'PO007', 'RF007', 'MSG00h7', 'IDVF00h7','REID007', 'RAID007', 'PGID007', 'GFH007', 'CC007', 'GC007', 'P007', 'R007', 'CAN007', 'REC007', 'charlotte_m@hotmail.com', 'm00re234', 'Charlotte Moore', '2021-11-11', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_7.png'), 7400123456, True, '27 George Sq, Glasgow, G2 1HH, UK'),
('H008', 'L008', 'LO008', 'PO008', 'RF008', 'MSG00h8', 'IDVF00h8','REID008', 'RAID008', 'PGID008', 'GFH008', 'CC008', 'GC008', 'P008', 'R008', 'CAN008', 'REC008', 'benjamin_c@gmail.com', 'clark#45', 'Benjamin Clark', '2018-03-11', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_8.png'), 6465550134, True, '10 Park Ave, New York, NY 10016, USA'),
('H009', 'L009', 'LO009', 'PO009', 'RF009', 'MSG00h9', 'IDVF00h9','REID009', 'RAID009', 'PGID009', 'GFH009', 'CC009', 'GC009', 'P009', 'R009', 'CAN009', 'REC009', 'nurhaliza12@gmail.com', 'siti&C0', 'Siti Nurhaliza', '2022-12-01', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_9.png'), 123456789, True, '7 Jalan Ampang, Kuala Lumpur, Malaysia'),
('H0010', 'L0010', 'LO0010', 'PO0010', 'RF0010', 'MSG00h10', 'IDVF0h10','REID0010', 'RAID0010', 'PGID0010', 'GFH0010', 'CC0010', 'GC0010', 'P0010', 'CAN0010', 'R0010', 'REC0010', 'will_evans89@gmail.com', 'Will@m09', 'William Evans', '2022-03-25', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_10.png'), 7900654321, False, '11 Victoria Rd, Leeds, LS1 6DE, UK'),
('H0011', 'L0011', 'LO0011', 'PO0011', 'RF0011', 'MSG00h11', 'IDVF0h11','REID0011', 'RAID0011', 'PGID0011', 'GFH0011', 'CC0011', 'GC0011', 'P0011', 'CAN0011', 'R0011', 'REC0011', 'sophie_wilson@mail.co.uk', 'Wils0n_1', 'Sophie Wilson', '2016-10-31', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_11.png'), 7722123456, True, '6 King St, Bristol, BS1 4DZ, UK'),
('H0012', 'L0012', 'LO0012', 'PO0012', 'RF0012', 'MSG00h12', 'IDVF0h12','REID0012', 'RAID0012', 'PGID0012', 'GFH0012', 'CC0012', 'GC0012', 'P0012', 'CAN0012', 'R0012', 'REC0012', 'thandiwe_nn2002@gmail.com', 'ndl0va_2', 'Thandiwe Ndlovu', '2018-07-01', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_12.png'), 821234567, True, '25 Long St, Cape Town, 8001, S. Africa'),
('H0013', 'L0013', 'LO0013', 'PO0013', 'RF0013', 'MSG00h13', 'IDVF0h13','REID0013', 'RAID0013', 'PGID0013', 'GFH0013', 'CC0013', 'GC0013', 'P0013', 'CAN0013', 'R0013', 'REC0013', 'karimi_Ali14@outlook.com', 'Ali_1989', 'Ali Karimi', '2019-06-15', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_13.png'), 9123456789, False, 'Valiasr Street 78, Tehran, Iran'),
('H0014', 'L0014', 'LO0014', 'PO0014', 'RF0014', 'MSG00h14', 'IDVF0h14','REID0014', 'RAID0014', 'PGID0014', 'GFH0014', 'CC0014', 'GC0014', 'P0014', 'CAN0014', 'R0014', 'REC0014', 'papadopoulos@gmail.com', 'E1enaa6', 'Elena Papadopoulos', '2023-09-17', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_14.png'), 6945678901, True, 'Ermou Street 45, Athens 10563, Greece'),
('H0015', 'L0015', 'LO0015', 'PO0015', 'RF0015', 'MSG00h15', 'IDVF0h15','REID0015', 'RAID0015', 'PGID0015', 'GFH0015', 'CC0015', 'GC0015', 'P0015', 'CAN0015', 'R0015', 'REC0015', 'ivan_olga@hotmail.com', 'Iv@nova0', 'Olga Ivanova', '2024-02-28', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_15.png'), 9162345678, True, 'Tverskaya Street 15, Moscow, Russia'),
('H0016', 'L0016', 'LO0016', 'PO0016', 'RF0016', 'MSG00h16', 'IDVF0h16','REID0016', 'RAID0016', 'PGID0016', 'GFH0016', 'CC0016', 'GC0016', 'P0016', 'CAN0016', 'R0016', 'REC0016', 'em_carter3098@gmail.com', 'C@rter13', 'Emily Carter', '2018-04-22', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_16.png'), 7911123456, False, '22 Baker St, London, W1U 3BW, UK'),
('H0017', 'L0017', 'LO0017', 'PO0017', 'RF0017', 'MSG00h17', 'IDVF0h17','REID0017', 'RAID0017', 'PGID0017', 'GFH0017', 'CC0017', 'GC0017', 'P0017', 'CAN0017', 'R0017', 'REC0017', 'ahmed_2010@mail.ng', 'Ahmmed_2', 'Ahmed Musa', '2024-05-26', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_17.png'), 8031234567, True, '10 Broad St, Lagos, 101001, Nigeria'),
('H0018', 'L0018', 'LO0018', 'PO0018', 'RF0018', 'MSG00h18', 'IDVF0h18','REID0018', 'RAID0018', 'PGID0018', 'GFH0018', 'CC0018', 'GC0018', 'P0018', 'CAN0018', 'R0018', 'REC0018', 'fatima.d902@outlook.com', 'f@t1ma70', 'Fatima Diallo', '2019-06-27', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_18.png'), 771234567, False, '5 Rue Blaise Diagne, Dakar, Senegal'),
('H0019', 'L0019', 'LO0019', 'PO0019', 'RF0019', 'MSG00h19', 'IDVF0h19','REID0019', 'RAID0019', 'PGID0019', 'GFH0019', 'CC0019', 'GC0019', 'P0019', 'CAN0019', 'R0019', 'REC0019', 'khan-alisha@gmail.com', 'Alish@34', 'Alisha Khan', '2024-08-09', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_19.png'), 3001234567, True, '22 Mall Rd, Lahore, 54000, Pakistan'),
('H0020', 'L0020', 'LO0020', 'PO0020', 'RF0020', 'MSG00h20', 'IDVF0h20','REID0020', 'RAID0020', 'PGID0020', 'GFH0020', 'CC0020', 'GC0020', 'P0020', 'CAN0020', 'R0020', 'REC0020', 'taylor.jess12@hotmail.com', 'Tj@1989', 'Jessica Taylor', '2025-04-04', bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/host_profiles/host_20.png'), 6175550102, False, '77 Mass Ave, Cambridge, MA 02139, USA');


/*Insert statement[20] for guest table*/
INSERT INTO guest 
VALUES('G001', 'L001', 'LO001', 'MSG00g1', 'IDVF00g1', 'RAID001','REID001', 'GFG001', 'P001', 'R001', 'CC001', 'GC001', 'RF001', 'CAN001', 'PY001', 'REC001', 'Ahmed Al-Farsi' , 'ahmed_alFarsi1@postse.se', 'Alfarsi8', 1521234567 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_1.png'), '23 Sheikh Zayed Road, Dubai, United Arab Emirates','2024-04-14'),
('G002', 'L002', 'LO002', 'MSG00g2', 'IDVF00g2', 'RAID002','REID002', 'GFG002', 'P002', 'R002', 'CC002', 'GC002', 'RF002', 'CAN002', 'PY002', 'REC002', 'Priya Sharma' , 'priya.sharma@mail.in', 'Priya_07', 9876543210 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_2.png'), '8 MG Rd, Bengaluru, 560001, India','2019-10-09'),
('G003', 'L003', 'LO003', 'MSG00g3', 'IDVF00g3', 'RAID003','REID003', 'GFG003', 'P003', 'R003', 'CC003', 'GC003', 'RF003', 'CAN003', 'PY003', 'REC003', 'Mehmet Yılmaz' , 'mehmet.yilmaz@mailbox.com.tr', 'mehmet@8', 5329876543 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_3.png'), 'Istiklal Caddesi 78, Beyoğlu, Istanbul, Turkey','2022-09-24'),
('G004', 'L004', 'LO004', 'MSG00g4', 'IDVF00g4', 'RAID004','REID004', 'GFG004', 'P004', 'R004', 'CC004', 'GC004', 'RF004', 'CAN004', 'PY004', 'REC004', 'Isabelle Dubois' , 'isabelle.dubois@messagerie.fr', '!sabelle', 3612345678 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_4.png'), '15 Rue de Rivoli, 75004 Paris, France','2020-12-17'),
('G005', 'L005', 'LO005', 'MSG00g5', 'IDVF00g5', 'RAID005','REID005', 'GFG005', 'P005', 'R005', 'CC005', 'GC005', 'RF005', 'CAN005', 'PY005', 'REC005', 'Sarah Johnson' , 'sarah.johnson@mail.com', 'sarah*56', 4155550123 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_5.png'), '200 Market St, San Francisco, CA 94105','2019-03-01'),
('G006', 'L006', 'LO006', 'MSG00g6', 'IDVF00g6', 'RAID006','REID006', 'GFG006', 'P006', 'R006', 'CC006', 'GC006', 'RF006', 'CAN006', 'PY006', 'REC006', 'Sophie Müller' , 'sophie.müeller@mailservice.de', 'Müller90', 17687654321 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_6.png'), 'Friedrichstraße 45, 10117 Berlin, Germany','2018-04-08'),
('G007', 'L007', 'LO007', 'MSG00g7', 'IDVF00g7', 'RAID007','REID007', 'GFG007', 'P007', 'R007', 'CC007', 'GC007', 'RF007', 'CAN007', 'PY007', 'REC007', 'Gracie Kim' , 'grace.kim@mail.kr', 'Gracy123', 1012345678 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_7.png'), '50 Gangnam-daero, Seoul, 06232, Korea','2021-02-23'),
('G008', 'L008', 'LO008', 'MSG00g8', 'IDVF00g8', 'RAID008','REID008', 'GFG008', 'P008', 'R008', 'CC008', 'GC008', 'RF008', 'CAN008', 'PY008', 'REC008', 'Amina Ben Ali' , 'amina.benali@tunisiamail.tn', 'Amina$3', 1620123456 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_8.png'), 'Avenue Habib Bourguiba 45, Tunis, Tunisia','2023-07-21'),
('G009', 'L009', 'LO009', 'MSG00g9', 'IDVF00g9', 'RAID009','REID009', 'GFG009', 'P009', 'R009', 'CC009', 'GC009', 'RF009', 'CAN009', 'PY009', 'REC009', 'Layla Al-Hariri' , 'layla.alhariri@cedarmail.lb', '@lHar1ri', 6171234567 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_9.png'), 'Hamra Street 36, Beirut, Lebanon','2024-11-22'),
('G0010', 'L0010', 'LO0010', 'MSG00g10', 'IDVF0g10', 'RAID0010','REID0010', 'GFG0010', 'P0010', 'R0010', 'CC0010', 'GC0010', 'RF0010', 'CAN0010', 'PY0010', 'REC0010', 'Henrik Johansson' , 'henrik.johansson@finmail.fi', 'Henrik#6', 58401234567 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_10.png'), 'Aleksanterinkatu 15, 00100 Helsinki, Finland','2021-12-28'),
('G0011', 'L0011', 'LO0011', 'MSG00g11', 'IDVF0g11', 'RAID0011','REID0011', 'GFG0011', 'P0011', 'R0011', 'CC0011', 'GC0011', 'RF0011', 'CAN0011', 'PY0011', 'REC0011', 'Emily Davis' , 'emily.davis@mail.com', 'Emily$6', 1612345678 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_11.png'), '300 Ocean Dr, Miami, FL 33139, USA','2019-04-30'),
('G0012', 'L0012', 'LO0012', 'MSG00g12', 'IDVF0g12', 'RAID0012','REID0012', 'GFG0012', 'P0012', 'R0012', 'CC0012', 'GC0012', 'RF0012', 'CAN0012', 'PY0012', 'REC0012', 'Emma Jansen' , 'emma.jansen@hollandmail.nl', 'Emmm@89', 3055550167 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_12.png'), 'Prinsengracht 263, 1016 GV Amsterdam, Netherlands','2023-7-31'),
('G0013', 'L0013', 'LO0013', 'MSG00g13', 'IDVF0g13', 'RAID0013','REID0013', 'GFG0013', 'P0013', 'R0013', 'CC0013', 'GC0013', 'RF0013', 'CAN0013', 'PY0013', 'REC0013', 'Liam Brown' , 'liam.brown@mail.co.uk', 'Br0wn@13', 7555123456 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_13.png'), '8 Queen St, Edinburgh, EH2 1JE, UK','2021-08-19'),
('G0014', 'L0014', 'LO0014', 'MSG00g14', 'IDVF0g14', 'RAID0014','REID0014', 'GFG0014', 'P0014', 'R0014', 'CC0014', 'GC0014', 'RF0014', 'CAN0014', 'PY0014', 'REC0014', 'Hannah Turner' , 'hannah.turner@mail.co.uk', 'Hannah34', 7560123456 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_14.png'), '9 Market Pl, York, YO1 8ST, UK','2024-10-28'),
('G0015', 'L0015', 'LO0015', 'MSG00g15', 'IDVF0g15', 'RAID0015','REID0015', 'GFG0015', 'P0015', 'R0015', 'CC0015', 'GC0015', 'RF0015', 'CAN0015', 'PY0015', 'REC0015', 'Nikola Petrović' , 'nikola.petrovic@serbmail.rs', 'Nik0la14', 81631234567 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_15.png'), 'Knez Mihailova 22, Belgrade, Serbia','2022-02-02'),
('G0016', 'L0016', 'LO0016', 'MSG00g16', 'IDVF0g16', 'RAID0016','REID0016', 'GFG0016', 'P0016', 'R0016', 'CC0016', 'GC0016', 'RF0016', 'CAN0016', 'PY0016', 'REC0016', 'Aisha Al-Thani' , 'aisha.althani@qatarnet.qa', 'Aisha8', 7433123456 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_16.png'), 'West Bay, Tower 4, Doha, Qata','2021-01-01'),
('G0017', 'L0017', 'LO0017', 'MSG00g17', 'IDVF0g17', 'RAID0017','REID0017', 'GFG0017', 'P0017', 'R0017', 'CC0017', 'GC0017', 'RF0017', 'CAN0017', 'PY0017', 'REC0017', 'Dimitri Papadakis' , 'dimitri.papadakis@cyprusmail.cy', 'Dimitri2', 5799123456 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_17.png'), 'Ledra Street 28, Nicosia, Cyprus','2019-07-17'),
('G0018', 'L0018', 'LO0018', 'MSG00g18', 'IDVF0g18', 'RAID0018','REID0018', 'GFG0018', 'P0018', 'R0018', 'CC0018', 'GC0018', 'RF0018', 'CAN0018', 'PY0018', 'REC0018', 'Hiroshi Tanaka' , 'hiroshi.tanaka@mail.jp', 'Hiroshi1', 9012345678 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_18.png'), '2 Chome-1-1 Nihonbashi, Tokyo, Japan','2024-04-24'),
('G0019', 'L0019', 'LO0019', 'MSG00g19', 'IDVF0g19', 'RAID0019','REID0019', 'GFG0019', 'P0019', 'R0019', 'CC0019', 'GC0019', 'RF0019', 'CAN0019', 'PY0019', 'REC0019', 'Anna Nowak' , 'anna.nowak@polmail.pl', 'Anna0987', 8501234567 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_19.png'), 'Floriańska 41, 31-019 Kraków, Poland','2019-09-19'),
('G0020', 'L0020', 'LO0020', 'MSG00g20', 'IDVF0g20', 'RAID0020','REID0020', 'GFG0020', 'P0020', 'R0020', 'CC0020', 'GC0020', 'RF0020', 'CAN0020', 'PY0020', 'REC0020', 'Wei Zhang' , 'wei.zhang@mail.cn', 'Zhang1!3', 13812345678 , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/guest_profiles/guest_20.png'), '99 Nanjing Rd, Shanghai, 200001, China','2023-03-23');


/*Insert statement[20] for listing table*/
INSERT INTO listing 
VALUES('L001', 'H001', 'R001', 'LO001', 'RAID001', 'P001', 'REID001', 'LA001', 'AMID001','CouplesPod House Portfolio' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_1/l1_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_1/l1_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_1/l1_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_1/l1_img4.png'),'If views, luxury, and romantic charm are your thing, we''ve got you covered! Couplespod at The Riverstone House Portfolio is our high end couples retreat.Guest access: Guests have exclusive use to the Pod. The farm is available for exploring providing Mountain and Valley views, and the dam for swimming.Other things to note: This is a working farm.The nearest shop is 15 mins away. We suggest you bring food along or shop in Ceres or Tulbagh.You will need your own transport in the area.', 547, 'Woleseley, Western Cape, South Africa', '2021-09-14', False, False, null),
('L002', 'H002', 'R002', 'LO002', 'RAID002', 'P002', 'REID002', 'LA002', 'AMID002','Emotional Healing House' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_2/l2_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_2/l2_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_2/l2_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_2/l2_img4.png'),'This is a guitar-shaped country house located in Icheon, a ceramic art village. It is a private house with a spacious terrace on the 3rd floor of the Sera Guitar Culture Center, famous for its unique appearance in the Icheon Ceramic Art Village, which blends in very well with nature. Enjoy a relaxing emotional healing vacation in a cozy and warm room. You can also enjoy the panoramic natural scenery from the 3rd floor location of the village without tall buildings, and you can also enjoy picnic on the lawn in front of the tonguita house.', 655, 'Sindun-myeon, Icheon-si, South Korea', '2023-10-31', False, True, 200),
('L003', 'H003', 'R003', 'LO003', 'RAID003', 'P003', 'REID003', 'LA003', 'AMID003','Living Greenhouse Off the Grid' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_3/l3_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_3/l3_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_3/l3_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_3/l3_img4.png'),'Welcome to the house of the future, off-grid with own energy and food production. One of the world''s most environmentally friendly and sustainable houses. Here you can enjoy a greenhouse garden with Mediterranean plants. On a mountain hike with miles of views of Lake Vänern is the house with proximity to the beach, boat harbor and beautiful nature in the corner', 449, 'Brålanda, Västra Götalands län, Sweden', '2024-09-23', True, False, null),
('L004', 'H004', 'R004', 'LO004', 'RAID004', 'P004', 'REID004', 'LA004', 'AMID004','Relaxation in Airloft' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_4/l4_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_4/l4_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_4/l4_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_4/l4_img4.png'),'This great place is anything but usual. A stylish highlight, nested in a park-like complex, our place offers an unforgettable overnight stay experience', 914, 'Göppingen, Baden-Württemberg, Germany', '2020-08-21', True, True, 200),
('L005', 'H005', 'R005', 'LO005', 'RAID005', 'P005', 'REID005', 'LA005', 'AMID005','WonderINN Mirrored Glass Cabin' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_5/l5_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_5/l5_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_5/l5_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_5/l5_img4.png'),'Immerse yourself in the wilderness, still within reach of civilization! WonderINN is literally a hidden gem; the unique design of the mirrored glass blends into the landscape so you can retreat to comfort and luxury as you watch the world pass by.', 369, 'Raelingen, Akershus, Norway', '2021-12-28', False, False, null),
('L006', 'H006', 'R006', 'LO006', 'RAID006', 'P006', 'REID006', 'LA006', 'AMID006','Anemoscope Windmill Villa' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_6/l6_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_6/l6_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_6/l6_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_6/l6_img4.png'),'Built around 1700, Anemoscope Windmill is an exclusive Boutique Villa, on 3 floors, of 180 internal square meters, recently and elegantly renovated. Open all year, with 3 bedrooms, 2 bathrooms and a large living room with lounge, equipped kitchen and dining area, it can comfortably accommodate up to 7 guests. In the outdoor areas, guests can try the Jacuzzi hot tub, sunbathe and admire the splendid 360° panoramic view, relaxing and enjoying the famous sunset over the Santorini caldera.', 433, 'Pyrgos Kallistis, Santorini, Greece', '2024-01-12', True, True, 300),
('L007', 'H007', 'R007', 'LO007', 'RAID007', 'P007', 'REID007', 'LA007', 'AMID007','Hornegg Castle: Entire Unit' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_7/l7_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_7/l7_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_7/l7_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_7/l7_img4.png'),'Hornegg Castle is situated on a hill with sweeping views of the countryside. The flats have been carefully renovated - nothing is perfect and smooth, everything has patina and lots of atmosphere. At our mirror lake, we have set up a sunbathing lawn on the shore and a bathing jetty, and a small boat is available. We offer a lot of culture, regional delicacies, fish from our own farm and fine wines. Gut Hornegg is like a small world within the world, where we warmly welcome our guests.', 612, 'Deutschlandsberg, Steiermark, Austria', '2023-06-27', True, True, 600),
('L008', 'H008', 'R008', 'LO008', 'RAID008', 'P008', 'REID008', 'LA008', 'AMID008','Cottage: Bed & Breakfast by the River' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_8/l8_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_8/l8_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_8/l8_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_8/l8_img4.png'),'Forth River Cottage is located 10 minutes drive from Devonport and 1 hr from Cradle Mountain.with full complimentary breakfast, on the banks of the Forth River in NW Tasmania. Ideal for one or two adults. Private, peaceful and designed for the most discerning traveller. Leave your worries behind as you take in the flowing river, the sunsets and green pastures. You won’t want to leave!', 398, 'Forth, Tasmania, Australia', '2021-03-13', False, False, null),
('L009', 'H009', 'R009', 'LO009', 'RAID009', 'P009', 'REID009', 'LA009', 'AMID009','Apartment Rental' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_9/l9_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_9/l9_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_9/l9_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_9/l9_img4.png'),'Cozy, spacious and inviting, you’ll feel at home in this 1 bedroom 1 bathroom suite which offers a view of Broadway street. Perfect for the solo traveler, couples, groups, families and those in town for business. We installed soundproof windows specifically for this unit to make sure noise will not be an issue', 549, 'Los Angeles, California, United States', '2021-11-26', False, False, null),
('L0010', 'H0010', 'R0010', 'LO0010', 'RAID0010', 'P0010', 'REID0010', 'LA0010', 'AMID0010','Dome Stays' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_10/l10_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_10/l10_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_10/l10_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_10/l10_img4.png'),'The best dome stay in Manali offers a unique and luxurious club for glamping experience in the heart of the mountains. Our property features hiking trails, picnic areas, and a scenic lookout point where you can marvel at the beauty of nature and witness the colors of the sky changing as the sun sets.', 809, 'Manali, Himachal Pradesh, India', '2018-04-12', True, True, 200),
('L0011', 'H0011', 'R0011', 'LO0011', 'RAID0011', 'P0011', 'REID0011', 'LA0011', 'AMID0011','Leafy Green Earthen Home' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_11/l11_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_11/l11_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_11/l11_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_11/l11_img4.png'),'Leafy Greens was built as a retreat center for our family and friends. It is where people would visit to refreshing their souls and mind. We work so hard to make this place to be one of the place that we can live in harmony with nature. That is why the cob houses are the right choice for us. Not only the buildings are eco-friendly but also the garden is organic. Visit here you will be able to take a deep breath and enjoy the fresh air with organic environment. It is a perfect place to getaway!', 341, 'Doi Suthep-Pui, Chiang Mai, Thailand', '2025-04-28', False, True, 100),
('L0012', 'H0012', 'R0012', 'LO0012', 'RAID0012', 'P0012', 'REID0012', 'LA0012', 'AMID0012','Glass Igloo Stays' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_12/l12_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_12/l12_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_12/l12_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_12/l12_img4.png'),'Ollero Eco Lodge is an ideal stay for couples, families and small groups who want to experience Lapland and the peace and quiet of arctic nature in an environmentally friendly way. A traditional Lapland cottage on the bank of the Ounasjoki river right outside the city of Rovaniemi, Ollero Eco Lodge is composed of three separate buildings', 650, 'Ounasvaara, Rovaniemi, Finland', '2020-05-27', True, True, 350),
('L0013', 'H0013', 'R0013', 'LO0013', 'RAID0013', 'P0013', 'REID0013', 'LA0013', 'AMID0013','Desert EnSuite Double Tents' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_13/l13_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_13/l13_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_13/l13_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_13/l13_img4.png'),'The camp is your second home and you are welcome to use all facilities. All meals are prepared in the camp so you will not need to access the kitchen, however we have a large tent for socialising, meals and interaction and individual private tents for guests to stay comfortably in a private space.', 445, 'Wadi Rum, Aqaba Governorate, Jordan', '2022-12-18', False, True, 310),
('L0014', 'H0014', 'R0014', 'LO0014', 'RAID0014', 'P0014', 'REID0014', 'LA0014', 'AMID0014','Cruise Stays' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_14/l14_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_14/l14_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_14/l14_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_14/l14_img4.png'),'Boasting a bar, the cruise is close to several noted attractions, around 600 metres from Bai Chay Beach, 800 metres from Ha Long Queen Cable Car and 800 metres from Sun World Ha Long Park. At the cruise, rooms are equipped with a wardrobe. Guests at cruise will be able to enjoy activities in and around Ha Long, like fishing.', 780, 'Hạ Long, Quảng Ninh, Vietnam', '2019-10-01', True, False, null),
('L0015', 'H0015', 'R0015', 'LO0015', 'RAID0015', 'P0015', 'REID0015', 'LA0015', 'AMID0015','Cave House' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_15/l15_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_15/l15_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_15/l15_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_15/l15_img4.png'),'In the heart of Cappadocia, Ortahisar, a cavehouse of 80 square meter, fully equipped kitchen with a scenic terrace is offered for a relaxing and enjoyable vacation. Our home is yours, we want to make you feel at peace and relaxed just like in your own home.', 967, 'Ortahisar, Nevsehir, Turkey', '2023-09-27', True, True, 220),
('L0016', 'H0016', 'R0016', 'LO0016', 'RAID0016', 'P0016', 'REID0016', 'LA0016', 'AMID0016','Tiny Home' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_16/l16_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_16/l16_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_16/l16_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_16/l16_img4.png'),'Absolutely ‘one of a kind’ tiny house! Brand new and custom-made, the Peacock is tucked away above the beautiful Saddleworth hills with jaw-dropping views across the valley. A luxury small space with every amenity you’ll need, the Peacock has a mezzanine king bed, plush comfortable dining/lounging area and kitchen complete with hob/extractor/dishwasher/microwave/wine chiller. Full shower room/toilet/sink with shaving point. The most ‘extra’ shepherd’s hut you’ve ever stayed at!', 321, 'Diggle, England, United Kingdom', '2019-04-14', False, False, null),
('L0017', 'H0017', 'R0017', 'LO0017', 'RAID0017', 'P0017', 'REID0017', 'LA0017', 'AMID0017','Naniwa Ryokan' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_17/l17_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_17/l17_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_17/l17_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_17/l17_img4.png'),'Located just a minute''s walk from JR Izumo Yokota Station, this is a convenient place to stay for both business and sightseeing. The owner serves up delicious dishes using local seasonal ingredients to give you the best possible dining experience at this former traditional restaurant.', 562, 'Okuizumo, Shimane Prefecture, Japan', '2020-01-31', True, True, 320),
('L0018', 'H0018', 'R0018', 'LO0018', 'RAID0018', 'P0018', 'REID0018', 'LA0018', 'AMID0018','TreeHouse Casarampi' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_18/l18_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_18/l18_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_18/l18_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_18/l18_img4.png'),'If you''re looking for a place to breathe away from the chaos, Walden House is the place.', 624, 'Sellano, Umbria, Italy', '2024-04-21', False, True, 340),
('L0019', 'H0019', 'R0019', 'LO0019', 'RAID0019', 'P0019', 'REID0019', 'LA0019', 'AMID0019','Island Villa: Entire Unit' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_19/l19_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_19/l19_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_19/l19_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_19/l19_img4.png'),'The space: Bask in the privacy of your own private island at this breathtaking Mauritius villa. Volcanic rocks protect the shore as the vibrant turquoise lagoon gently waves, filling the air with an intoxicating saltwater scent. Tropical shrubbery guides you to the entrance where you’ll discover stone, weathered wood, and raw concrete inside. Purchase fresh seafood from local fishermen to savor on the deck.', 999, 'Roches Noires, Rivière du Rempart, Mauritius', '2021-11-17', True, True, 500),
('L0020', 'H0020', 'R0020', 'LO0020', 'RAID0020', 'P0020', 'REID0020', 'LA0020', 'AMID0020','Historical Room Stay' , bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_20/l20_img1.png'), bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_20/l20_img2.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_20/l20_img3.png'),bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/listing_images/L_20/l20_img4.png'),'You can access Topaze through a corridor open to the patio and beautiful carved (original) wooden doors. With its two small windows overlooking the street, its seating area and its bedroom in a golden and ebony sand harmony, its bed sky and delicately carved furniture, its sanitary space in dark brown tadelakt, it invites African change of scenery. It is for two people a haven of privacy and exotic sweetness', 731, 'Fes, Fès-Meknès, Morocco', '2018-10-25', True, True, 500);

/*Insert statement[20] for admin table*/
INSERT INTO admin
VALUES('AD001','H001','G001','L001', 'IDVF00a1','REID001','RAID001','REC001','BO001','LA001','PO001','PY001','GFH001','PGID001','GFG001','GC001','CC001','CAN001','RF001','antonio.rossi@postamail.it','Anton!0','Antonio Rossi',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_1.png'),'Website Manager','Via Roma 34, 00184 Rome, Italy','3934567890','2016-07-11'),
('AD002','H002','G002','L002', 'IDVF00a2','REID002','RAID002','REC002','BO002','LA002','PO002','PY002','GFH002','PGID002','GFG002','GC002','CC002','CAN002','RF002','fatima.alsaud@mailnet.sa','A1-$aud','Fatima Al-Saud',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_2.png'),'Administrative Head','King Fahd Road 56, Riyadh, Saudi Arabia','9507654321','2018-02-07'),
('AD003','H003','G003','L003', 'IDVF00a3','REID003','RAID003','REC003','BO003','LA003','PO003','PY003','GFH003','PGID003','GFG003','GC003','CC003','CAN003','RF003','jorgen.nielsen@postbox.dk','J@rgen12','Jørgen Nielsen',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_3.png'),'Customer Executive','Nyhavn 17, 1051 Copenhagen, Denmark','4520987654','2024-06-02'),
('AD004','H004','G004','L004', 'IDVF00a4','REID004','RAID004','REC004','BO004','LA004','PO004','PY004','GFH004','PGID004','GFG004','GC004','CC004','CAN004','RF004','hassan.mahmoud@mailegy.eg','Hass@n_3','Hassan Mahmoud',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_4.png'),'Customer Executive','26 Tahrir Square, Cairo, Egypt','2012345678','2020-09-25'),
('AD005','H005','G005','L005', 'IDVF00a5','REID005','RAID005','REC005','BO005','LA005','PO005','PY005','GFH005','PGID005','GFG005','GC005','CC005','CAN005','RF005','jan.kowalski@postmail.pl','K0walsk!','Jan Kowalski',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_5.png'),'Database Administrator','Nowy Świat 23, 00-029 Warsaw, Poland','48512345678','2017-01-19'),
('AD006','H006','G006','L006', 'IDVF00a6','REID006','RAID006','REC006','BO006','LA006','PO006','PY006','GFH006','PGID006','GFG006','GC006','CC006','CAN006','RF006','mohammed.alqasimi@gulfmail.bh','Mohammed','Mohammed Al-Qasimi',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_6.png'),'Customer Executive','Diplomatic Area, Building 315, Manama, Bahrain','973361234','2018-08-19'),
('AD007','H007','G007','L007', 'IDVF00a7','REID007','RAID007','REC007','BO007','LA007','PO007','PY007','GFH007','PGID007','GFG007','GC007','CC007','CAN007','RF007','lukas.novak@mailcz.cz','Luk@s90','Lukas Novak',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_7.png'),'KYC Officer','Václavské náměstí 21, 110 00 Prague, Czech Republic','4206012567','2021-10-15'),
('AD008','H008','G008','L008', 'IDVF00a8','REID008','RAID008','REC008','BO008','LA008','PO008','PY008','GFH008','PGID008','GFG008','GC008','CC008','CAN008','RF008','noor.alabdullah@jordanmail.jo','Abdu1!ah','Noor Al-Abdullah',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_8.png'),'Customer Executive','Rainbow Street 23, Amman, Jordan','9629865432','2023-11-23'),
('AD009','H009','G009','L009', 'IDVF00a9','REID009','RAID009','REC009','BO009','LA009','PO009','PY009','GFH009','PGID009','GFG009','GC009','CC009','CAN009','RF009','maria.popescu@mailro.ro','P0p*scu','Maria Popescu',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_9.png'),'Talent Acquisition Manager','Calea Victoriei 25, Bucharest, Romania','4072123456','2017-01-19'),
('AD0010','H0010','G0010','L0010', 'IDVF00a10','REID0010','RAID0010','REC0010','BO0010','LA0010','PO0010','PY0010','GFH0010','PGID0010','GFG0010','GC0010','CC0010','CAN0010','RF0010','yusuf.almansour@kuwaitnet.kw','Yusuf_01','Yusuf Al-Mansour',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_10.png'),'Customer Executive','Salem Al Mubarak Street 12, Salmiya, Kuwai','965661256','2022-11-03'),
('AD0011','H0011','G0011','L0011', 'IDVF00a11','REID0011','RAID0011','REC0011','BO0011','LA0011','PO0011','PY0011','GFH0011','PGID0011','GFG0011','GC0011','CC0011','CAN0011','RF0011','liam.oconnor@emeraldmail.ie','Conn0r_2','Liam O''Connor',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_11.png'),'Customer Executive','Grafton Street 34, Dublin 2, Ireland','3538312347','2017-07-30'),
('AD0012','H0012','G0012','L0012', 'IDVF00a12','REID0012','RAID0012','REC0012','BO0012','LA0012','PO0012','PY0012','GFH0012','PGID0012','GFG0012','GC0012','CC0012','CAN0012','RF0012','omar.alsaid@omantel.om','A1-S@ad','Omar Al-Saad',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_12.png'),'Developer','Al Khuwair Street 15, Muscat, Oman','968934567','2019-09-07'),
('AD0013','H0013','G0013','L0013', 'IDVF00a13','REID0013','RAID0013','REC0013','BO0013','LA0013','PO0013','PY0013','GFH0013','PGID0013','GFG0013','GC0013','CC0013','CAN0013','RF0013','ziad.almasri@syriamail.sy','A1-M@sri','Ziad Al-Masri',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_13.png'),'Tax Manager','Straight Street 45, Damascus, Syria','67584930219','2016-06-01'),
('AD0014','H0014','G0014','L0014', 'IDVF00a14','REID0014','RAID0014','REC0014','BO0014','LA0014','PO0014','PY0014','GFH0014','PGID0014','GFG0014','GC0014','CC0014','CAN0014','RF0014','tane.williams@oceania.com','Wi1!iams','Tane Williams',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_14.png'),'Customer Executive','12 Kauri Rd, Auckland 1010, New Zealand','64214567890','2023-05-14'),
('AD0015','H0015','G0015','L0015', 'IDVF00a15','REID0015','RAID0015','REC0015','BO0015','LA0015','PO0015','PY0015','GFH0015','PGID0015','GFG0015','GC0015','CC0015','CAN0015','RF0015','lani.faumuina@pacificmail.com','Faum3!na','Lani Faumuina',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_15.png'),'Website Manager','45 Beach Rd, Apia, Samoa','6857212345','2025-06-21'),
('AD0016','H0016','G0016','L0016', 'IDVF00a16','REID0016','RAID0016','REC0016','BO0016','LA0016','PO0016','PY0016','GFH0016','PGID0016','GFG0016','GC0016','CC0016','CAN0016','RF0016','mereani.vatu@fijilink.com','Mer*1ni','Mereani Vatu',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_16.png'),'Database Administrator','8 Suva St, Suva, Fiji','6799982345','2021-10-15'),
('AD0017','H0017','G0017','L0017', 'IDVF00a17','REID0017','RAID0017','REC0017','BO0017','LA0017','PO0017','PY0017','GFH0017','PGID0017','GFG0017','GC0017','CC0017','CAN0017','RF0017','hine.moana@tahitiwave.pf','Moana_04','Hine Moana',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_17.png'),'Tax Manager','22 Papeete Ave, Papeete, Tahiti, French Polynesia','68987954321','2021-04-06'),
('AD0018','H0018','G0018','L0018', 'IDVF00a18','REID0018','RAID0018','REC0018','BO0018','LA0018','PO0018','PY0018','GFH0018','PGID0018','GFG0018','GC0018','CC0018','CAN0018','RF0018','sione.tupou@tongamail.to','S!on*','Sione Tupou',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_18.png'),'Social Media Manager','3 Vuna Rd, Nuku''alofa, Tonga','6767712345','2019-09-07'),
('AD0019','H0019','G0019','L0019', 'IDVF00a19','REID0019','RAID0019','REC0019','BO0019','LA0019','PO0019','PY0019','GFH0019','PGID0019','GFG0019','GC0019','CC0019','CAN0019','RF0019','ratu.bale@vanuatuconnect.vu','Ratu_345','Ratu Jone Bale',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_19.png'),'Talent Acquisition Manager','10 Port Vila Rd, Port Vila, Vanuatu','6785551234','2021-10-15'),
('AD0020','H0020','G0020','L0020', 'IDVF00a20','REID0020','RAID0020','REC0020','BO0020','LA0020','PO0020','PY0020','GFH0020','PGID0020','GFG0020','GC0020','CC0020','CAN0020','RF0020','maryanne.kaur@papuamail.pg','Mary@nn*','Maryanne Kaur',bytea('/Users/masoomshaikh/Documents/iu-airbnb-project/db_images/admin_profiles/admin_20.png'),'Asst.Social Media Manager','15 Ela Beach, Port Moresby, Papua New Guinea','7572004321','2018-08-19');


/*Insert Statement[40] for booking table*/
INSERT INTO booking 
VALUES('BO001', 'G001', 'L008', '2 Adults', '0', 398, '4 Nights', 1592, 'Credit Card', '2021-11-26', 'Confirmed', False),
('BO002', 'G0010', 'L001', '2 Adults', '1 Dog', 547, '3 Nights', 1641, 'PayPal', '2022-10-06', 'Cancelled', False),
('BO003', 'G0012', 'L003', '2 Adults, 1 Child', '0', 449, '2 Nights', 1347 ,'Debit Card', '2021-01-02', 'Confirmed', False),
('BO004', 'G0019', 'L0020', '2 Adults', '1 Cat', 731, '5 Nights', 3675,'Booking Credits', '2021-12-26', 'Confirmed', True),
('BO005', 'G0014', 'L0017', '6 Adults', '0', 562, '7 Nights', 3934,'Credit Card', '2024-05-30', 'Cancelled', True),
('BO006', 'G0016', 'L0018', '2 Adults, 2 Children', '0', 624, '3 Nights', 2496,'Apple Pay', '2025-03-21', 'Cancelled', True),
('BO007', 'G0018', 'L004', '1 Adult', '0', 914, '2 Nights', 1828,'PayPal', '2022-06-06', 'Confirmed', True),
('BO008', 'G007', 'L002', '1 Adults', '0', 655, '6 Nights', 3930,'Debit Card', '2024-10-31', 'Confirmed', True),
('BO009', 'G006', 'L0019', '2 Adults', '0', 999, '5 Nights', 4995,'PayPal', '2023-07-27', 'Cancelled', True),
('BO0010', 'G003', 'L0013', '3 Adults', '0', 445, '2 Night', 890, 'Credit Card', '2025-04-28', 'Confirmed', True),
('BO0011', 'G004', 'L006', '2 Adults', '0', 433, '4 Nights', 1732, 'Apple Pay', '2024-09-23', 'Cancelled', True),
('BO0012', 'G002', 'L009', '1 Adult', '0', 549, '2 Nights', 1098, 'Booking Credits', '2023-06-27', 'Confirmed', False),
('BO0013', 'G001', 'L0015', '2 Adults', '0', 967, '3 Nights', 2901, 'PayPal', '2024-01-19', 'Cancelled', True),
('BO0014', 'G0016', 'L0013', '1 Adult', '1 Dog', 445, '3 Nights', 1335, 'PayPal', '2023-09-27', 'Confirmed', True),
('BO0015', 'G006', 'L008', '2 Adults', '2 Cats', 398, '7 Nights', 2786, 'Booking Credits', '2021-11-26', 'Cancelled', False),
('BO0016', 'G009', 'L0010', '3 Adults', '0', 809, '6 Nights', 4854, 'Booking Credits', '2019-03-13', 'Confirmed', True),
('BO0017', 'G0020', 'L0016', '1 Adult', '1 Dog', 321, '2 Nights', 642, 'Credit Card', '2019-10-01', 'Cancelled', False),
('BO0018', 'G009', 'L0012', '5 Adults', '0', 650, '7 Nights', 4550, 'Debit Card', '2023-05-27', 'Confirmed', True),
('BO0019', 'G0013', 'L0011', '2 Adults, 2 Children', '1 Cat, 1 Dog', 341, '2 Nights', 682, 'Apple Pay', '2025-02-28', 'Cancelled', True),
('BO0020', 'G0018', 'L001', '1 Adult', '1 Chameleon', 547, '1 Nights', 547, 'Credit Card', '2024-11-30', 'Confirmed', True),
('BO0021', 'G008', 'L002', '1 Adult', '1 Hamster', 655, '4 Nights', 2620, 'PayPal', '2021-12-24', 'Cancelled', True),
('BO0022', 'G003', 'L0017', '6 Adults', '0', 562, '3 Nights', 1686, 'Credit Card', '2020-10-31', 'Confirmed', True),
('BO0023', 'G002', 'L0018', '2 Adults', '0', 624, '4 Nights', 2496, 'Debit Card', '2024-06-22', 'Confirmed', True),
('BO0024', 'G0019', 'L0019', '3 Adults, 1 Child', '1 Parrot', 999, '6 Nights', 5994, 'Debit Card', '2021-12-17', 'Cancelled', True),
('BO0025', 'G0017', 'L0020', '1 Adult', '0', 731, '2 Nights', 1462, 'Credit Card', '2021-11-26', 'Confirmed', True),
('BO0026', 'G0015', 'L005', '2 Adults', '1 Dog', 547, '3 Nights', 1641, 'Apple Pay', '2018-11-25', 'Cancelled', False),
('BO0027', 'G0020', 'L003', '4 Adults', '2 Parrots, 1 Dog', 449, '7 Nights', 3143, 'Apple Pay', '2024-09-26', 'Confirmed', False),
('BO0028', 'G0016', 'L0015', '2 Adults, 3 Children', '0', 967, '4 Nights', 3868, 'Booking Credits', '2023-09-30', 'Cancelled', True),
('BO0029', 'G0014', 'L007', '20 Adults, 7 Children', '3 Dogs', 612, '10 Nights', 6120, 'Credit Card', '2023-09-27', 'Confirmed', True),
('BO0030', 'G0013', 'L006', '3 Adults', '0', 433, '4 Nights', 1732, 'PayPal', '2024-04-17', 'Cancelled', True),
('BO0031', 'G0014', 'L0010', '1 Adult', '0', 809, '3 Nights', 2427, 'Credit Card', '2019-10-10', 'Confirmed', True),
('BO0032', 'G001', 'L0014', '13 Adults', '2 Cats', 780, '12 Nights', 9360, 'Credit Card', '2019-10-21', 'Cancelled', False),
('BO0033', 'G0010', 'L0016', '2 Adults, 1 Child', '0', 321, '2 Nights', 642, 'Debit Card', '2019-08-24', 'Cancelled', False),
('BO0034', 'G0012', 'L008', '5 Adults', '2 Hamsters', 398, '4 Nights', 1592, 'Debit Card', '2021-06-13', 'Confirmed', False),
('BO0035', 'G0011', 'L0012', '4 Adults', '0', 341, '4 Nights', 1364, 'PayPal', '2023-12-18', 'Cancelled', True),
('BO0036', 'G007', 'L0013', '6 Adults', '0', 445, '3 Nights', 1335, 'Credit Card', '2023-09-30', 'Cancelled', True),
('BO0037', 'G008', 'L009', '1 Adult', '0', 549, '2 Nights', 1098, 'Booking Credits', '2021-11-26', 'Confirmed', False),
('BO0038', 'G004', 'L0014', '3 Adults', '0', 780, '9 Nights', 7020, 'Credit Card', '2022-05-25', 'Cancelled', True),
('BO0039', 'G003', 'L0020', '2 Adults', '1 Cat', 731, '4 Nights', 2924, 'Apple Pay', '2019-01-13', 'Cancelled', True),
('BO0040', 'G001', 'L001', '2 Adults', '0', 547, '3 Nights', 1641, 'Debit Card', '2021-12-14', 'Confirmed', False);



/*Insert Statement[20] for Coupon table*/
INSERT INTO coupon
VALUES('CC001', 'New-User[10% Off]','Valid', '(2024-09-09, 2024-10-09)'),
('CC002', 'Mother''s Day[30% Off]','InValid', '(2019-01-01, 2019-03-01)'),
('CC003', 'Father''s Day[30% Off]','Valid', '(2025-01-20, 2025-05-20)'),
('CC004', 'Winter Wonderland[10% Off]','InValid', '(2025-02-19, 2025-02-28)'),
('CC005', 'Missed-You-Guest[15% Off]','Valid', '(2025-04-12, 2025-04-22)'),
('CC006', 'Christmas-Offer[25% Off]','InValid', '(2018-12-23, 2019-01-13)'),
('CC007', 'Easter-Fun[10% Off]','InValid', '(2019-05-13, 2019-05-23)'),
('CC008', 'Summer-with-Sun[10% Off]','Valid', '(2025-04-04, 2025-04-14)'),
('CC009', 'Happy Birthday[35% Off] ','Valid', '(2025-10-01, 2025-10-10)'),
('CC0010', 'Flat-15 % off with Credit-Pay','Valid', '(2025-01-01, 2025-11-01)'),
('CC0011', 'Flat-25 % off with Apple-Pay','Valid', '(2025-01-02, 2025-11-02)'),
('CC0012', 'Flat-15 % off with Booking Credits','Valid', '(2025-01-10, 2025-11-10)'),
('CC0013', 'New-Year-New-You[20% Off]','InValid', '(2021-12-30, 2022-01-09)'),
('CC0014', 'Valentine''s-Day[25% Off]','InValid', '(2023-02-05, 2023-02-15)'),
('CC0015', 'St.Patrick-Day[10% Off]','InValid', '(2022-04-20, 2022-04-30)'),
('CC0016', 'Ramadan Offer[10% Off]','InValid', '(2018-09-09, 2028-10-09)'),
('CC0017', 'Happy-Anniversary[35% Off]','Valid', '(2024-09-09, 2024-10-09)'),
('CC0018', 'Debit Card Offer[15% Off]','Valid', '(2025-11-15, 2025-11-25)'),
('CC0019', 'Party-101[15% Off]','Valid', '(2025-01-01, 2025-11-01)'),
('CC0020', 'Black Friday[20% Off]','Valid', '(2025-01-01, 2025-12-01)');



/*Insert Statement[20] for Giftcard table*/
INSERT INTO giftcard
VALUES('GC001','Thank-You[20% Off]','Valid','(2024-09-10,2024-10-09)'),
('GC002','Sweet Sibling[20% Off]','InValid','(2019-01-02,2019-03-01)'),
('GC003','Best Mom[30% Off]','Valid','(2025-01-21,2025-05-20)'),
('GC004','Best Dad[30% Off]','Valid','(2025-02-20,2025-02-28)'),
('GC005','Winter Wonderland[10% Off]','Valid','(2025-04-13,2025-04-22)'),
('GC006','Christmas Celebrations[25% Off]','InValid','(2018-12-24,2019-01-13)'),
('GC007','Entertaining Easter[15% Off]','InValid','(2019-05-14,2019-05-23)'),
('GC008','Summer-with-Sun[10% Off]','Valid','(2025-04-05,2025-04-14)'),
('GC009','Birthday-Bash[35% Off]','Valid','(2025-10-02,2025-10-10)'),
('GC0010','Flat-15 % off with Credit-Pay','Valid','(2025-01-02,2025-11-01)'),
('GC0011','Flat-25 % off with Apple-Pay','Valid','(2025-01-03,2025-11-02)'),
('GC0012','Flat-15 % off with Booking Credits','Valid','(2025-01-11,2025-11-10)'),
('GC0013','New-Year-New-You[20% Off]','InValid','(2021-12-31,2022-01-09)'),
('GC0014','Valentine''s-Day[25% Off]','InValid','(2023-02-06,2023-02-15)'),
('GC0015','St.Patrick-Day[10% Off]','InValid','(2022-04-21,2022-04-30)'),
('GC0016','Ramadan Offer[10% Off]','InValid','(2018-09-10,2018-10-09)'),
('GC0017','Happy-Anniversary[35% Off]','Valid','(2024-09-10,2024-10-09)'),
('GC0018','Black Friday[20% Off]','Valid','(2025-11-16,2025-11-25)'),
('GC0019','Graduation-Celebration[15% Off]','Valid','(2025-01-02,2025-11-01)'),
('GC0020','BFF[20% Off]','Valid','(2025-01-02,2025-12-01)');


/*Insert Statement[40] for receipt table*/
INSERT INTO receipt
VALUES('REC001','CC001','GC0010','BO001','2021-11-26',0.00,1592,'10%','0',50,90,1732,1558,'Not Applicable','Confirmed'),
('REC002','CC001','GC0016','BO002','2022-10-06',0.00,1641,'10%','0',45,80,1766,1589,'Not Applicable','Cancelled'),
('REC003','CC005','GC0010','BO003','2021-01-02',0.00,1347,'15%','15%',50,100,1497,1047,'Not Applicable','Confirmed'),
('REC004','CC004','GC003','BO004','2021-12-26',500,3675,'0','30%',65,110,4350,3045,'Paid','Confirmed'),
('REC005','CC008','GC0014','BO005','2024-05-30',340,3934,'10%','10%',70,140,4484,3587,'Paid','Cancelled'),
('REC006','CC001','GC0010','BO006','2025-03-21',300,2496,'10%','0',50,100,2946,2651,'Paid','Cancelled'),
('REC007','CC002','GC0010','BO007','2022-06-06',400,1828,'0','35%',35,70,2333,1516,'Paid','Confirmed'),
('REC008','CC009','GC0013','BO008','2024-10-31',200,3930,'35%','0',70,135,4335,2817.75,'Paid','Confirmed'),
('REC009','CC0010','GC008','BO009','2023-07-27',500,4995,'15%','10%',100,150,5745,3734.25,'Paid','Cancelled'),
('REC0010','CC001','GC0016','BO0010','2025-04-28',310,890,'10%','0',35,70,1305,1174.50,'Paid','Confirmed'),
('REC0011','CC0020','GC0015','BO0011','2024-09-23',300,1732,'20%','0',45,90,2167,1733.60,'Paid','Cancelled'),
('REC0012','CC0011','GC007','BO0012','2023-06-27',0.00,1098,'25%','0',40,80,1218,913,'Not Applicable','Confirmed'),
('REC0013','CC0012','GC0010','BO0013','2024-01-19',220,2901,'15%','15%',50,100,3271,2289,'Paid','Cancelled'),
('REC0014','CC001','GC0010','BO0014','2023-09-27',310,1335,'10%','15%',50,90,1785,1338.75,'Paid','Confirmed'),
('REC0015','CC0017','GC008','BO0015','2021-11-26',0.00,2786,'35%','10%',70,105,2961,1628.55,'Not Applicable','Cancelled'),
('REC0016','CC001','GC0013','BO0016','2019-03-13',220,4854,'10%','0',80,140,5294,4764.60,'Paid','Confirmed'),
('REC0017','CC0018','GC0014','BO0017','2019-10-01',0.00,642,'15%','0',50,80,772,656.20,'Not Applicable','Cancelled'),
('REC0018','CC001','GC0015','BO0018','2023-05-27',350,4550,'10%','0',90,145,5035,4531.50,'Paid','Confirmed'),
('REC0019','CC0019','GC001','BO0019','2025-02-28',0.00,682,'15%','',50,80,758,644.30,'Not Applicable','Cancelled'),
('REC0020','CC0016','GC0010','BO0020','2024-11-30',500,547,'0','20%',50,50,1147,917.60,'Paid','Confirmed'),
('REC0021','CC0020','GC001','BO0021','2021-12-24',200,2620,'20%','20%',70,110,3000,1800,'Paid','Cancelled'),
('REC0022','CC0010','GC005','BO0022','2020-10-31',320,1686,'15%','10%',45,105,2156,1401.40,'Paid','Confirmed'),
('REC0023','CC0015','GC0011','BO0023','2024-06-22',340,2496,'0','15%',65,115,3016,2563.60,'Paid','Confirmed'),
('REC0024','CC0018','GC004','BO0024','2021-12-17',500,5994,'15%','35%',105,170,6769,3384.50,'Paid','Cancelled'),
('REC0025','CC0012','GC0013','BO0025','2021-11-26',500,1462,'15%','15%',50,100,2112,1478.40,'Paid','Confirmed'),
('REC0026','CC001','GC003','BO0026','2018-11-25',0.00,1641,'10%','0',50,100,1791,1611.90,'Not Applicable','Cancelled'),
('REC0027','CC0013','GC0010','BO0027','2024-09-26',0.00,3143,'0','15%',85,120,3348,2845.80,'Not Applicable','Confirmed'),
('REC0028','CC0012','GC008','BO0028','2023-09-30',220,3868,'15%','10%',70,105,4231,2808.65,'Paid','Cancelled'),
('REC0029','CC0016','GC0012','BO0029','2023-09-27',600,6120,'0','15%',100,130,6950,5907.50,'Paid','Confirmed'),
('REC0030','CC0020','GC007','BO0030','2024-04-17',300,1732,'20%','0',50,100,2182,1745.60,'Paid','Cancelled'),
('REC0031','CC0010','GC0011','BO0031','2019-10-10',200,2427,'15%','25%',50,100,2777,1666.20,'Paid','Confirmed'),
('REC0032','CC0015','GC0010','BO0032','2019-10-21',0.00,9360,'0','15%',120,210,9690,8236.50,'Not Applicable','Cancelled'),
('REC0033','CC0013','GC0010','BO0033','2019-08-24',0.00,642,'0','15%',50,100,792,673.20,'Not Applicable','Cancelled'),
('REC0034','CC001','GC0013','BO0034','2021-06-13',0.00,1592,'10%','0',50,100,1742,1567.80,'Not Applicable','Confirmed'),
('REC0035','CC0014','GC0010','BO0035','2023-12-18',350,1364,'0','15%',50,100,1864,1584.40,'Paid','Cancelled'),
('REC0036','CC007','GC0012','BO0036','2023-09-30',310,1335,'0','15%',50,100,1795,1525.75,'Paid','Cancelled'),
('REC0037','CC0016','GC0017','BO0037','2021-11-26',0.00,1098,'0','35%',50,100,1248,811.20,'Not Applicable','Confirmed'),
('REC0038','CC0019','GC0016','BO0038','2022-05-25',0.00,7020,'15%','0',105,150,7275,6183.75,'Not Applicable','Cancelled'),
('REC0039','CC003','GC0015','BO0039','2019-01-13',500,2924,'30%','0',50,100,3574,2501.80,'Paid','Cancelled'),
('REC0040','CC002','GC0018','BO0040','2021-12-14',0.00,1641,'0','20%',50,100,1791,1432.80,'Not Applicable','Confirmed');


/*Insert Statement[40] for payouts table*/
INSERT INTO payouts
VALUES('PO001','Account Number','H008','2021-11-30','Successful',1558,100,1458),
('PO002','PayPal','H001','2022-10-16','Cancelled',1589,100,1489),
('PO003','Debit Card','H003','2021-01-12','Successful',1047,80,967),
('PO004','UPI','H0020','2021-12-31','Successful',3045,200,2845),
('PO005','Account Number','H0017','2024-06-02','Cancelled',3587,200,3387),
('PO006','Apple Pay','H0018','2025-03-30','Cancelled',2651,150,2501),
('PO007','PayPal','H004','2022-06-10','Successful',1516,100,1416),
('PO008','Debit Card','H002','2024-11-01','Successful',2817.75,150,2667.75),
('PO009','PayPal','H0019','2023-07-27','Cancelled',3734.25,200,3534.25),
('PO0010','Account Number','H0013','2025-04-28','Successful',1174.5,90,1084.5),
('PO0011','Apple Pay','H006','2024-09-25','Cancelled',1733.6,90,1643.6),
('PO0012','Booking Credits','H009','2023-06-29','Successful',913,80,833),
('PO0013','PayPal','H0015','2024-01-20','Cancelled',2289,100,2189),
('PO0014','PayPal','H0013','2023-09-29','Successful',1338.75,95,1243.75),
('PO0015','Booking Credits','H008','2021-11-27','Cancelled',1628.55,85,1543.55),
('PO0016','Booking Credits','H0010','2019-03-13','Successful',4764.6,210,4554.6),
('PO0017','Account Number','H0016','2019-10-03','Cancelled',656.2,85,571.2),
('PO0018','Apple Pay','H0012','2023-05-28','Successful',4531.5,210,4321.5),
('PO0019','Account Number','H0011','2025-02-28','Cancelled',644.3,80,564.3),
('PO0020','Account Number','H001','2024-12-11','Successful',917.6,90,827.6),
('PO0021','PayPal','H002','2021-12-24','Cancelled',1800,100,1700),
('PO0022','Account Number','H0017','2020-10-31','Successful',1401.4,95,1306.4),
('PO0023','Debit Card','H0018','2024-06-26','Successful',2563.6,150,2413.6),
('PO0024','Debit Card','H0019','2021-12-18','Cancelled',3384.5,200,3184.5),
('PO0025','Account Number','H0020','2021-11-27','Successful',1478.4,100,1378.4),
('PO0026','Apple Pay','H001','2018-11-25','Cancelled',1611.9,90,1521.9),
('PO0027','Apple Pay','H003','2024-09-26','Successful',2845.8,210,2635.8),
('PO0028','Booking Credits','H0015','2023-09-30','Cancelled',2808.65,200,2608.65),
('PO0029','Account Number','H007','2023-09-28','Successful',5907.5,300,5607.5),
('PO0030','Booking Credits','H006','2024-04-19','Cancelled',1745.6,90,1655.6),
('PO0031','Account Number','H0010','2019-10-13','Successful',1666.2,80,1586),
('PO0032','Account Number','H0014','2019-10-23','Cancelled',8236.5,500,7736.5),
('PO0033','Debit Card','H0016','2019-08-24','Cancelled',673.2,80,593.2),
('PO0034','Debit Card','H008','2021-06-15','Successful',1567.8,105,1479.8),
('PO0035','PayPal','H0012','2023-12-19','Cancelled',1584.4,105,1479.4),
('PO0036','Account Number','H0013','2023-09-30','Cancelled',1525.75,105,1420.75),
('PO0037','Booking Credits','H009','2021-11-29','Successful',811.2,90,721.2),
('PO0038','Account Number','H0014','2022-05-25','Cancelled',6183.75,510,5673.75),
('PO0039','Apple Pay','H0020','2019-01-14','Cancelled',2501.8,150,2351.8),
('PO0040','Debit Card','H001','2021-12-17','Successful',1432.8,105,1327.8);


/*Insert Statement[40] for payments table*/
INSERT INTO payments
VALUES('PY001','Credit Card','G001','2021-11-26','Successful',1558),
('PY002','PayPal','G0010','2022-10-06','Cancelled',1589),
('PY003','Debit Card','G0012','2021-01-02','Successful',1047),
('PY004','Booking Credits','G0019','2021-12-26','Successful',3045),
('PY005','Credit Card','G0014','2024-05-30','Refund',3587),
('PY006','Apple Pay','G0016','2025-03-21','Cancelled',2651),
('PY007','PayPal','G0018','2022-06-06','Successful',1516),
('PY008','Debit Card','G007','2024-10-31','Successful',2817.75),
('PY009','PayPal','G006','2023-07-27','Refund',3734.25),
('PY0010','Credit Card','G003','2025-04-28','Successful',1174.5),
('PY0011','Apple Pay','G004','2024-09-23','Cancelled',1733.6),
('PY0012','Booking Credits','G002','2023-06-27','Successful',913),
('PY0013','PayPal','G001','2024-01-19','Refund',2289),
('PY0014','PayPal','G0016','2023-09-27','Successful',1338.75),
('PY0015','Booking Credits','G006','2021-11-26','Cancelled',1628.55),
('PY0016','Booking Credits','G009','2019-03-13','Successful',4764.6),
('PY0017','Credit Card','G0020','2019-10-01','Cancelled',656.2),
('PY0018','Apple Pay','G009','2023-05-27','Successful',4531.5),
('PY0019','Credit Card','G0013','2025-02-28','Cancelled',644.3),
('PY0020','CreditCard','G0018','2024-11-30','Successful',917.6),
('PY0021','PayPal','G008','2021-12-24','Cancelled',1800),
('PY0022','Credit Card','G003','2020-10-31','Successful',1401.4),
('PY0023','Debit Card','G002','2024-06-22','Successful',2563.6),
('PY0024','Debit Card','G0019','2021-12-17','Refund',3384.5),
('PY0025','Credit Card','G0017','2021-11-26','Successful',1478.4),
('PY0026','Apple Pay','G0015','2018-11-25','Refund',1611.9),
('PY0027','Apple Pay','G0020','2024-09-26','Successful',2845.8),
('PY0028','Booking Credits','G0016','2023-09-30','Cancelled',2808.65),
('PY0029','Credit Card','G0014','2023-09-27','Successful',5907.5),
('PY0030','Booking Credits','G0013','2024-04-17','Cancelled',1745.6),
('PY0031','Credit Card','G0014','2019-10-10','Successful',1666.2),
('PY0032','Credit Card','G001','2019-10-21','Refund',8236.5),
('PY0033','Debit Card','G0010','2019-08-24','Cancelled',673.2),
('PY0034','Debit Card','G0012','2021-06-13','Successful',1567.8),
('PY0035','PayPal','G0011','2023-12-18','Cancelled',1584.4),
('PY0036','Credit Card','G007','2023-09-30','Cancelled',1525.75),
('PY0037','Booking Credits','G008','2021-11-26','Successful',811.2),
('PY0038','Credit Card','G004','2022-05-25','Refund',6183.75),
('PY0039','Apple Pay','G003','2019-01-13','Refund',2501.8),
('PY0040','Debit Card','G001','2021-12-14','Successful',1432.8);




/*Insert Statement[14] for guide_book_for_guest table*/
INSERT INTO guide_book_for_guest 
VALUES('GFG001','Getting Started','Whether a Host, guest, or Airbnb is trying to reach you, it’s important to keep your account updated. Once you’re logged in, go to your Account to edit things like your email address or phone number. Note that some of this account info will be public (like your picture or first name), but we don’t share things like your government ID, payment info, or email address.','Help Centre'),
('GFG002','Setting Up Guest Account','Before you can book a reservation a few things need to happen, like your government ID and phone number need to be verified. You can submit a copy of your government ID—which we don’t share with Hosts or anyone else—through the identity verification system. If you need to add and verify your phone number, go to your Account and we’ll text you a code to complete the process.','Help Centre'),
('GFG003','Know About Your Host','Hosts appreciate guests who treat their place as if it were their own. At Airbnb, we’ve implemented a number of policies and protections to help you attract guests who will be a good fit for your space.','Help Centre'),
('GFG004','Booking for Business,Travel & Events','Arranging accommodation for business trips is a cinch with Airbnb for Work, which puts a worldwide selection of homes and boutique hotels along with a suite of helpful tools right at your fingertips.','Help Centre'),
('GFG005','Seacrh Tips','To make sure the space is just right, use the search filters to find a place entirely to yourself, or other options if you’d prefer some shared spaces. Learn more about the different filters and amenities available.','Help Centre'),
('GFG006','FAQ','Need a little more help or have a complaint? Contact us by email, chat or phone on +44 203 318 1111.','Help Centre'),
('GFG007','Commuicate with Host','Once you find a place you like, you may still have questions about it. While you can’t visit the property before booking, you can contact the Host to find out more.If you have specific preferences for amenities, the neighborhood, or the location, you can message the Host, since they are the best source for all details. They may even send you a pre-approval or special offer to entice you to book their place.','How To'),
('GFG008','Check Verified Listing','We require primary hosts, co-hosts and booking guests to be verified for all stays on Airbnb.While there’s no time limit for hosts to complete verification, the listing won’t be published until they finish. This means they can’t accept bookings until after the identity has been verified. Similarly, as a co-host, they’ll need to finish verification before they can accept your invite.','How To'),
('GFG009','Changes in Resevation','If you sent the host of a place to stay a reservation request, they have 24 hours to respond. If they decline or don’t respond, no worries: You won’t be charged and are free to book a different stay. Either way, be sure your account is up to date with valid payment information and your verified ID. (Some hosts require it.) For Instant Book listings, your reservation is automatically confirmed.','How To'),
('GFG0010','Proper First Aid Tips','If you’ll be more than an hour away from medical care, you may want to find out what kind of medical training or certification your host has, such as a Wilderness First Responder (WFR), Wilderness Advanced First Aid (WAFA), or CPR. You can also ask them about their safety evacuation plan in case of an emergency.','How To'),
('GFG0011','Practise Safety Concerns','Safety is one of our top priorities. To help prevent surprises and ensure transparency, we ask that Hosts to welcome guests responsibly by completing all safety and accessibility sections with helpful details about what to expect.','How To'),
('GFG0012','Background Checks','Keeping our Airbnb family safe is one of our top priorities. If we have at least a first name, last name, and date of birth for a user who creates a listing, or is associated with a booking, we may perform a background check on that user. We also may perform background checks on Hosts based on where they are located.','How To'),
('GFG0013','Cancellation Policy/Rules','Cancellation policies are set by the host and vary by listing. If a host has selected a policy with a fully refundable option, you can cancel the reservation for free—just make sure you cancel before the time and date listed.','Know More'),
('GFG0014','Refund Policy/Rules','You may be entitled to a full refund or one larger than the standard refund of your host’s cancellation policy if:You have to cancel because of a major disruptive event.You have to cancel because of a qualifying reason covered by the Airbnb Rebooking and Refund Policy.During your stay, you’re experiencing an issue covered by the Airbnb Rebooking and Refund Policy','Know More');




/*Insert Statement[19] for guide_book_for_guest table*/
INSERT INTO guide_book_for_host 
VALUES('GFH001','Getting Started','If you’re interested in hosting your space, we’ll guide you through the process step-by-step. Make sure your home is clean, clutter-free, and that everything is working properly. Items like fresh linen and stocked toiletries help create a comfortable and inviting place to stay.A five-star stay starts with attention to detail in your space. A welcoming home can lead to your first great reviews.','Help Centre'),
('GFH002','Setting Up Host Account','Creating an account is free and easy! We’ll need to know a few basic details for you to get started. You can sign up for an account online or on the Airbnb app by using your email, phone number, Apple ID, Facebook or Google account, or Naver (for South Korea).','Help Centre'),
('GFH003','Creating a Listing','You can create a listing in just a few steps, all at your own pace. Start by telling us about your home, take some photos and add details about what makes it unique.','Help Centre'),
('GFH004','Help with Reservations','Congrats! Someone out there is hoping to call your place home for a little while. You have 24 hours to act on requests before they expire, so set up notifications to ensure you get them as soon as possible.If you missed your 24-hour window to accept a guest you want to host, no worries: Ask them to send new request and throw in a special offer for good measure.','Help Centre'),
('GFH005','Sustainability','Booking a listing requires all guests to follow ground rules for guests. They must treat your space with respect, follow your house rules, communicate promptly if issues arise and leave your home in a state that doesn’t require excessive cleaning.','Help Centre'),
('GFH006','Tools and Features','To help you feel more comfortable hosting, there are settings and features that let you control how and when you host.If you''re not sure how to choose your booking settings or create your house rules, don’t worry. We’ll guide you through the different opt','Help Centre'),
('GFH007','FAQ','Need a little more help or have a complaint? Contact us by email, chat or phone on +44 203 318 1111.','Help Centre'),
('GFH008','Setting Up Property Rules','Once you find a place you like, you may still have questions about it. While you can’t visit the property before booking, you can contact the Host to find out more.If you have specific preferences for amenities, the neighborhood, or the location, you can message the Host, since they are the best source for all details. They may even send you a pre-approval or special offer to entice you to book their place.','How To'),
('GFH009','Commmunicate with Guests','Our community is built on the principles of inclusion, belonging, and respect, which includes welcoming and supporting people with disabilities','How To'),
('GFH0010','Changes in Resevation','If a guest cancels their booking, your cancellation policy applies. If you''re owed a payout, the money will typically be sent to you 24 hours after your guest''s scheduled check-in time. If a guest alters their booking, we’ll typically send payment 24 hours after their new check-in time.','How To'),
('GFH0011','Proper First Aid Tips','If you’ll be more than an hour away from medical care, you may want to find out what kind of medical help your guest needs, such as a Wilderness First Responder (WFR), Wilderness Advanced First Aid (WAFA), or CPR. You can also let them know about your safety evacuation plan in case of an emergency.','How To'),
('GFH0012','Account Management','When you start to host, and periodically throughout your time hosting, we''ll reach out for information and updates. The exact information we request may vary by regional regulations.','How To'),
('GFH0013','Practise Safety Concerns','Safety is one of our top priorities. To help prevent surprises and ensure transparency, by being informed about safety issues allows you to plan ahead and welcome guests as comfortably as possible.','How To'),
('GFH0014','Background Checks','Keeping our family safe is one of our top priorities. If we have at least a first name, last name, and date of birth for a user who creates a listing, or is associated with a booking, we may perform a background check on that user. We also may perform background checks on Guests based on where they are located.','How To'),
('GFH0015','Cancellation Policy/Rules','Cancellation policies are set by the host and vary by listing. If a host has selected a policy with a fully refundable option, you can cancel the reservation for free—just make sure you cancel before the time and date listed.','Know More'),
('GFH0016','Refund Policy/Rules','It depends on how a cancellation would affect you and your hosting business. Think about your needs and goals, as well as your ideal guests, and choose the policy that supports them.','Know More'),
('GFH0017','Calendar & Booking Settings','Changing your trip lengths can open your calendar and help your listing appear in more search results. Make sure your minimum and maximum trip lengths follow local rules and regulations.Syncing all your hosting calendars helps prevent multiple guests from booking on the same dates. This two-way connection automatically updates both calendars when a night is booked.','Know More'),
('GFH0018','Marketing and Promotion','Running a promotion is a great way to stand out in search results and drive more bookings. Make sure that you get perks for offering a deal and that guests are getting a price that’s lower than your typical price for that specific date.','Know More'),
('GFH0019','Hosting Resources','Hosting resources or availability settings and pricing tools often work together. If you want to use certain tools, such as offering monthly discounts, you may have to change your availability, like allowing longer stays.','Know More');



/*Insert Statement[20] for guide_book_for_guest table*/
INSERT INTO guide_published_by_host 
VALUES('PGID001','H001','GuideBook for CapeTown','Cape Town offers a variety of attractions, from iconic landmarks to natural wonders. For a comprehensive experience, consider visiting Table Mountain, V&A Waterfront, Kirstenbosch National Botanical Garden, Robben Island, and Cape Point Nature Reserve.If you''re craving for a great vacation, you should plan a trip to Cape Town, where most of the travellers go in the months of December, January and February. And you will have perfect attractions to explore like Iziko South African Museum, Tygerberg Nature Reserve and Scarborough Beach. Scheduling your trip around the moderate season in the months of September, October and November, you will cherish mild temperatures, fewer tourists, and great opportunities for outdoor activities. If you wish to have a grasp of their culture and practices closely, travel around these months: (January, February, and March/April. You will be able to witness their grand festivals: Cape Town Minstrel Carnival, Cape Town Art Fair, and Cape Town International Jazz Festival. Take a break from your mundane routine and unwind in Cape Town to make some lovely memories!','2023-04-12','Travel'),
('PGID002','H002',null,null,null,null),
('PGID003','H003',null,null,null,null),
('PGID004','H004',null,null,null,null),
('PGID005','H005','What to do in Huser Farm','Located in scenic surroundings, the farm offers a tranquil and inspiring atmosphere ideal for fostering creativity, collaboration, and focus.The rustic yet modern facilities create a unique setting for meetings and gatherings, allowing you to focus on what matters most – interaction and great ideas.Additionally, WonderInn offers comfortable accommodation options, so you can combine productive meetings with a relaxing evening in beautiful surroundings.Huser Farm provides a calm and inspiring environment to strengthen the team, develop new ideas, and create lasting memories.','2017-06-04','Travel'),
('PGID006','H006',null,null,null,null),
('PGID007','H007',null,null,null,null),
('PGID008','H008','Places to Eat and Things to Do while staying at Forth River Cottage','Traditional pub fair - steaks, burgers, parmi. Also offer fish and vegetarian options.Now called Seasons By the Sea, this tapas style restaurant uses fresh and local produce in a beautiful setting overlooking the beach in Penguin. Serving Tasmanian Wine and Beers. It is a favourite based on the fabulous beach location and the creative use of local produce to produce consistently delicious fare.A beautiful windy walk following the Forth Falls Creek, through to some picturesque waterfalls cascading into Lake Barrington. The Falls are accessible from Lake Barrington Rd, accessibility is easy and parking is available along the side of the road. The walk is approximately 3 km, steep in some places and allow for approximately 2 hours.','2019-12-12','City Advice'),
('PGID009','H009','Ali''s Los Angeles GuideBook','Metro is a fast way to get around and it''s 5 blocks away. I would recommend the 7th and metro station. You can get to universal studios, santa monica pier and Hollywood boulevard. But make sure to be aware of your surroundings.','2024-09-18','City Advice'),
('PGID0010','H0010',null,null,null,null),
('PGID0011','H0011',null,null,null,null),
('PGID0012','H0012',null,null,null,null),
('PGID0013','H0013',null,null,null,null),
('PGID0014','H0014','Hoa''s GuideBook','Seafood is prevalent in Da Nang and the best place to get fresh, delicious seafood is La Plage. This beachfront restaurant inside the Sheraton Grand Danang Resort offers a casual atmosphere with gorgeous views of the sea. Their Signature Seafood Basket is not to be missed!','2021-09-07','Travel'),
('PGID0015','H0015',null,null,null,null),
('PGID0016','H0016','Nic''s GuideBook','Food Scene: Lovely, cosy pub with a great menu and steaks to blow your mind. Check out their website for their speciality menus on certain evenings. Advance booking essential, especially on a weekend. Dining in White Hart: Perfect for a special evening celebration, the food, wine and service are excellent. On the pricier side but worth it for a treat. Shopping: Lovely ladies''boutique on the high st in Uppermill, quirky and original','2023-10-17','Travel'),
('PGID0017','H0017','Kizuki line switchback through Yamanami and Daike Ryu Oni no Tongue Walking Course','An iconic tourist attraction in Okuizumo Town.You''ll be overwhelmed by large boulders and bizarre rocks, but one of the attractions is that you can walk around in one side.It''s also a good idea to walk while listening to the babbling of the river and birds chirping amidst the negative ions.','2020-03-20','City Advice'),
('PGID0018','H0018',null,null,null,null),
('PGID0019','H0019',null,null,null,null),
('PGID0020','H0020','comment arrivée chez nous','évitez les faut guides qui offre son services contacter avec moi par Telefon ou par WhatsApp a ce numero: +212 661294926','2018-10-25','City Advice');



/*Insert Statement[20] for review*/
INSERT INTO review 
VALUES('REID001','G001','L008','What a beautiful relaxing getaway! Spent our honeymoon here and it was exactly what we were looking for. The beauty was unmatched and the privacy was on another level. I will say, try to come in a car that can handle climbing up a dirt road.','2021-12-01'),
('REID0012','G0012','LOO3','This was such an incredible house to stay in. It is a beautifully and cleverly constructed, spacious house which was very relaxing and comfortable. The fire pit, bbq, and hot tub were great. The location was very peaceful with lots of birds singing all around the house.','2021-01-04'),
('REID0019','G0019','L0020','Beautiful ryad. The host was a courteous professional, laid out. He advised me to organize a few outings outside Fez.Really a beautiful and good place, well maintained and with good service','2022-01-03'),
('REID0018','G0018','L004','Absolute dream! Anyone who has the opportunity should book this place by Peter. Truly a once-in-a-lifetime experience. Not only is the place unique, but also Peter himself. Peter tries to fulfill every wish and is a very friendly host.','2022-06-10'),
('REID007','G007','L002','I really used it comfortably! It was equipped with towels and toiletries, and the atmosphere was cozy and warm as shown in the photos. Thanks to your thoughtful decoration, I used it well, and I want to visit again!','2024-11-13'),
('REID003','G003','LOO13','The people of the Wadi Rum desert were so very warm and welcoming. The scenery was awesome. Arabian Night tent accommodation was as described and met all our needs.','2025-05-02'),
('REID002','G002','L009','An amazing place in beautiful surroundings. Breakfast and other provisions were homemade, superbly presented and plentiful. Truly delightful.','2023-06-30'),
('REID0016','G0016','L0013','If you’re looking for wadi rum dessert, this is the place to be. It’s really is in the outback with no communication and the chaps onsite are really friendly. What really makes this trip however is the day tours out.','2023-10-02'),
('REID009','G009','L0010','Firstly the apartment is lovely with all the amenities one could possibly hope for. Ali as a host is lovely, very helpful and responsive with answers to any queries. Couldn’t recommend this space enough.','2019-03-23'),
('REID009','G009','L0012','Photos don’t do this beautiful alpine cottage justice! Such a peaceful and private location. The cabins have been cleverly modernised without losing touch with the rustic charm.','2023-08-07'),
('REID0018','G0018','L001','BETTER THAN ADVERTISED! The photos really don''t do it justice, the space is incredibly well put together, from furnishes to the design to the location. We will for sure be returning.','2024-12-02'),
('REID003','G003','L0017','The location is perfectly situated nearby the train station in the peaceful Yokota, Shimane. All you need for a get-away is right here. Stop searching. Really, this place is fantastic.','2020-11-05'),
('REID002','G002','L0018','A unique experience, to do at least once in your life. The treehouse leaves breathless, the view of the Umbrian hills is indescribable in words. A slice of paradise surrounded by greenery. Also wonderful is the large box with breakfast offered in the morning.','2024-06-27'),
('REID0017','G0017','L0020','Dar Victoria is beautiful. The staff are VERY accommodating. I requested a room with more light instead of the room in the photo and Brahim accommodated me. It’s was on the roof top. Absolutely beautiful','2021-11-29'),
('REID0020','G0020','L003','Absolutely incredible place to visit and stay! Anders was super nice and showed us around and clearly explained how everything worked.Highly recommend this home for those who want to experience something out of the ordinary!','2024-10-03'),
('REID0014','G0014','L007','Warm welcome and fantastic location with beautiful swimming lake. Animal friendly, well organized, clean and very well equipped. We will be happy to come back. Silvia and Pasquale','2023-10-20'),
('REID0014','G0014','L0010','Place was clean, tidy and appreciated the doorman for security in downtown LA. Comfy bed and spacious apt. Some sounds audible from upstairs unit, but not bad. Noise abatement windows were helpful','2019-10-15'),
('REID0012','G0012','L008','What a little piece of paradise! The best B & B we''ve ever been to! So luxe and 5 star! You have thought of absolutely everything to make our stay perfect. We enjoyed all those little extras that you provided. Thank you for sharing this lovely property with us','2021-06-20'),
('REID008','G008','L009','We really loved Ali''s place! The space was beautiful and spacious! Me and hubby came out to celebrate our anniversary and we wanted something unforgettable and this place delivered and exceeded our expectations!','2021-11-29'),
('REID001','G001','L001','What an amazing place! This is a part where the place exceeds the pictures. Kitchen had all the needed amenities, it’s private and the view is just incredible. Instructions to arrive were also very clear. We’ll recommend our friends to come here for a retreat for sure!','2021-12-18');


/*Insert Statement[20] for rating*/
INSERT INTO rating 
VALUES('RAID001','G001','L008','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA1,RCA6:RA1',4.99,'2021-12-01'),
('RAID0012','G0012','LOO3','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA3,RCA6:RA3',4.96,'2021-01-04'),
('RAID0019','G0019','L0020','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA3,RCA5:RA3,RCA6:RA1',4.8,'2022-01-03'),
('RAID0018','G0018','L004','RCA1:RA2,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA3,RCA6:RA3',5.0,'2022-06-10'),
('RAID007','G007','L002','RCA1:RA4,RCA2:RA2,RCA3:RA1,RCA4:RA2,RCA5:RA2,RCA6:RA3',4.84,'2024-11-13'),
('RAID003','G003','LOO13','RCA1:RA4,RCA2:RA2,RCA3:RA2,RCA4:RA3,RCA5:RCA5:RA2,RCA6:RA3',4.86,'2025-05-02'),
('RAID002','G002','L009','RCA1:RA1,RCA2:RA1,RCA3:RA2,RCA4:RA1,RCA5:RA3,RCA6:RA2',4.95,'2023-06-30'),
('RAID0016','G0016','L0013','RCA1:RA4,RCA2:RA2,RCA3:RA2,RCA4:RA3,RCA5:RA2,RCA6:RA3',4.86,'2023-10-02'),
('RAID009','G009','L0010','RCA1:RA2,RCA2:RA2,RCA3:RA3,RCA4:RA1,RCA5:RA4,RCA6:RA3',4.93,'2019-03-23'),
('RAID009','G009','L0012','RCA1:RA2,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA1,RCA6:RA2',4.96,'2023-08-07'),
('RAID0018','G0018','L001','RCA1:RA1,RCA2:RA1,RCA3:RA2,RCA4:RA2,RCA5:RCA5:RA2,RCA6:RA2',4.94,'2024-12-02'),
('RAID003','G003','L0017','RCA1:RA3,RCA2:RA2,RCA3:RA1,RCA4:RCA4:RA1,RCA5:RA1,RCA6:RA4',4.74,'2020-11-05'),
('RAID002','G002','L0018','RCA1:RA1,RCA2:RA2,RCA3:RA2,RCA4:RA1,RCA5:RA2,RCA6:RA2.',5.0,'2024-06-27'),
('RAID0017','G0017','L0020','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA3,RCA5:RA3,RCA6:RA1',4.8,'2021-11-29'),
('RAID0020','G0020','L003','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA3,RCA6:RA3',4.96,'2024-10-03'),
('RAID0014','G0014','L007','RCA1:RA4,RCA2:RA3,RCA3:RA4,RCA4:RA3,RCA5:RA4,RCA6:R6',4.0,'2023-10-20'),
('RAID0014','G0014','L0010','RCA1:RA2,RCA2:RA2,RCA3:RA3,RCA4:RA1,RCA5:RA4,RCA6:RA3',4.93,'2019-10-15'),
('RAID0012','G0012','L008','RCA1:RA1,RCA2:RA1,RCA3:RA1,RCA4:RA1,RCA5:RA1,RCA6:RA1',4.99,'2021-06-20'),
('RAID008','G008','L009','RCA1:RA1,RCA2:RA1,RCA3:RA2,RCA4:RA1,RCA5:RA3,RCA6:RA2',4.95,'2021-11-29'),
('RAID001','G001','L001','RCA1:RA1,RCA2:RA1,RCA3:RA2,RCA4:RA2,RCA5:RA2,RCA6:RA2',4.94,'2021-12-18');




/*Insert Statement[51] for rating_number*/
INSERT INTO rating_number
VALUES('RA1',5.0),
('RA2',4.9),
('RA3',4.8),
('RA4',4.7),
('RA5',4.6),
('RA6',4.5),
('RA7',4.4),
('RA8',4.3),
('RA9',4.2),
('RA10',4.1),
('RB1',4.0),
('RB2',3.9),
('RB3',3.8),
('RB4',3.7),
('RB5',3.6),
('RB6',3.5),
('RB7',3.4),
('RB8',3.3),
('RB9',3.2),
('RB10',3.1),
('RC1',3.0),
('RC2',2.9),
('RC3',2.8),
('RC4',2.7),
('RC5',2.6),
('RC6',2.5),
('RC7',2.4),
('RC8',2.3),
('RC9',2.2),
('RC10',2.1),
('RD1',2.0),
('RD2',1.9),
('RD3',1.8),
('RD4',1.7),
('RD5',1.6),
('RD6',1.5),
('RD7',1.4),
('RD8',1.3),
('RD9',1.2),
('RD10',1.1),
('RE1',1.0),
('RE2',0.9),
('RE3',0.8),
('RE4',0.7),
('RE5',0.6),
('RE6',0.5),
('RE7',0.4),
('RE8',0.3),
('RE9',0.2),
('RE10',0.1),
('RE11',0.0);


/*Insert Statement[6] for rating_category table*/
INSERT INTO rating_category
VALUES('RCA1','Cleanliness'),
('RCA2','Accuracy'),
('RCA3','Check-in'),
('RCA4','Communication'),
('RCA5','Location'),
('RAC6','Value');


/*Insert Statement[12] for policy table*/
INSERT INTO policy
VALUES('POID001','Refund for Cancelled Reservations','If you need to cancel a reservation, you may be eligible for a refund – it all depends on your Host’s cancellation policy and when you cancel the reservation.'),
('POID002','Refund If Cancelled before Check-In','Refunds are subject to your host’s cancellation policy. Depending on the length of your stay, how soon your reservation starts and the cancellation policy that applies to your reservation, you may get a full refund, a partial refund or no refund if you cancel before check-in. The cleaning fee is part of the booking total and any refund before check-in is based on the host’s cancellation policy for the reservation.'),
('POID003','Refund If Cancelled after Check-In','Refunds are subject to your host’s cancellation policy. Depending on the length of your stay, the nights you’ve stayed and the cancellation policy that applies to your reservation, you may get a partial refund or no refund if you cancel after check-in. The cleaning fee is part of the booking total and any refund after check-in is based on the host’s cancellation policy for the reservation.'),
('POID004','Refund Policy-Original Method','Refunds are issued to the original payment method that you used when you made the reservation. In many cases, you’ll notice both a payment charge and a separate refund amount on your payment method.'),
('POID005','Cancellation Within 24 Hours of Booking','If you cancel within the first 24 hours after booking, we may not have charged your payment quite yet and only placed a hold on your payment method. In this case, we’ll simply remove the payment hold, which is often an invisible backend process.'),
('POID006','Cancellation deadlines and refunds','The times and dates we display for cancellation policies are based on the local time zone of the listing. Cancellation deadlines for receiving refunds are measured from the check-in time for the listing in its local time zone, or 3:00 PM if no check-in time is specified.'),
('POID007','Paid with Coupon','If you cancel a reservation in which you used a coupon to pay, the coupon can’t be used again.If your host cancels a reservation in which you used a coupon to pay, your coupon code will remain active and can be used towards another reservation'),
('POID008','Paid with Booking Credit','Refunds for booking credit are subject to your host’s cancellation policy and may be refunded as credit that can be used again.'),
('POID009','Cancellation Policies for your listing','Your standard cancellation policy applies to all reservations of 27 or fewer consecutive nights. Your long-term cancellation policy applies to monthly stays, which are reservations of 28 or more consecutive nights.'),
('POID0010','If Hosts cancels a booking','Cancelling a guest’s reservation can have serious implications for their trip, so we may impose fees and other consequences. We will waive the fees and, in some cases, the other consequences, if the Host cancels because of a Major Disruptive Event or certain valid reasons beyond the Host’s control.'),
('POID0011','Cancelling a reservation as a Host','We understand that cancellations are sometimes unavoidable due to circumstances outside of the Host’s control. If a Host has to cancel for a valid reason, we’ll work with them and help their guests find another place to stay, without the Host incurring cancellation fees or other consequences from cancelling.'),
('POID0012','Smoking Policy','If you don''t allow smoking, we suggest posting signs to remind guests. If you do allow smoking, ensure you have ashtrays available in designated areas.'),
('POID0013','Behavior Commitment','I agree to treat everyone in the community - regardless of their race, religion, national origin, ethnicity, disability, sex, gender identity, sexual orientation, or age - with respect, and without judgement or bias.');


/*Insert Statement[7] for rules table*/
INSERT INTO rules
VALUES('ROO1','Health and Cleanliness Rules','Staying organised can help you make the most of your time. Store all your cleaning supplies in one place, like a portable storage tray or an owner’s locked cupboard, and restock regularly.Cleaning thoroughly between guests is an essential part of five-star hosting. One of the most common reasons guests give Hosts fewer than five stars is a lack of cleanliness.'),
('ROO2','Safety','Indicate local emergency numbers and the nearest hospital. Provide a clear emergency contact number for yourself, as well as backup, for easy guest reference. Also make clear how you should be contacted if the guest has questions or issues arise.'),
('ROO3','Preventive Measures for Fire Hazard','Ensure you have a functioning smoke alarm and carbon monoxide detector, and that your property meets government safety guidelines for your area (ex: National Building Code or other local building bylaws). Ensure you provide a functioning fire extinguisher and complete required maintenance.Ensure you have a clearly marked fire escape route, and post a map in your home.'),
('ROO4','Privacy','Always be mindful of your guests'' privacy. Fully disclose whether there are security cameras or other surveillance equipment at or around your listing. Make sure you are aware of and comply with applicable federal, state, and local laws.'),
('ROO5','Access & Child-Proofing','Go through your home to identify any areas where guests might trip or fall and either remove the hazard or mark clearly. Fix any exposed wires. Ensure stairs are safe and have railings. Remove or lock up any objects that may be dangerous to your guests. Ensure your home is safe for children, or else notify guests of potential hazards.'),
('ROO6','Building Rules','Ensure you relay your building''s common area rules to your guest. You may want to even notify your neighbors that you will have guests, and remind guests not to bother your neighbors (ex: don''t knock on their door or buzz them to let you in).Ensure you relay parking rules for your building and neighborhood to your guest.'),
('ROO7','House Rules','To avoid surprises, you may want to include the information covered above in your House Rules in your Airbnb listing profile.If you allow pets, ensure guests are educated about things like local parks and local customs (ex: cleaning up after your dog).Remind guests about keeping noise down. You may want to consider whether you allow babies, pets, or parties.');



/*Insert Statement[20] for cancellation table*/
INSERT INTO cancellation
VALUES('CAN0010','L001','G0010','H001','RF0010','REC002','Payment Failure','2022-10-06','Transaction Failed'),
('CAN0014','L0017','G0014','H0017','RF0014','REC005','Other, Personal Reason','2024-05-31','Applied for Refund'),
('CAN0016','L0018','G0016','H0018','RF0016','REC006','Other, Need to change booking the dates','2025-03-23','Help from Customer Service'),
('CAN0019','L0019','G006','H0019','RF006','REC006','Cancellation made by host: Pipe Damages','2023-07-29','Providing a Full Refund'),
('CAN004','L006','G004','H006','RF004','REC0011','Payment Failure','2024-09-23','Transaction Failed'),
('CAN001','L0015','G001','H0015','RF001','REC0013','Payment Failure','2024-01-19','Transaction Failed'),
('CAN006','L008','G006','H008','RF006','REC0015','Not Available on the booked dates','2021-11-28','Applied for Refund'),
('CAN0020','L0016','G0020','H0016','RF0020','REC0017','Change in travel plans','2019-10-03','Applied for Refund'),
('CAN0013','L0011','G0013','H0011','RF0013','REC0019','Unexpected Weather Events','2025-03-03','Applied for Refund'),
('CAN008','L002','G008','H002','RF008','REC0021','Security reasons flagged by Airbnb[Id Verification Not Completed]','2021-12-24', 'Transaction Cancelled'),
('CAN0019','L0019','G0019','H0019','RF0019','REC0024','Found a Cheaper place','2021-12-17','Applied for Refund'),
('CAN0015','L001','G0015','H001','RF0015','REC0026','Other, Personal Reason','2018-11-25','Applied for Refund'),
('CAN0016','L0015','G0016','H0015','RF0016','REC0028','Payment Failure','2023-09-30','Transaction Failed'),
('CAN0013','L006','G0013','H006','RF0013','REC0030','Change in number of guests','2024-04-17','Help from Customer Service'),
('CAN0014','L0014','G001','H0014','RF001','REC0032','Cancellation made by host: Double Booking or Calendar Error','2019-10-21','Providing a Full Refund'),
('CAN0016','L0016','G0010','H0016','RF0010','REC0033','Security reasons flagged by Airbnb[Id Verification Not Completed]','2019-08-24','Transaction Cancelled'),
('CAN0012','L0012','G0011','H0012','RF0011','REC0035','Visa Issues','2023-12-18','Help from Customer Service'),
('CAN007','L0013','G007','H0013','RF007','REC0036','Payment Failure','2023-09-30','Transaction Failed'),
('CAN004','L0014','G004','H0014','RF004','REC0038','Found a Cheaper place','2022-05-25','Applied for a Refund'),
('CAN003','L0020','G003','H0020','RF003','REC0039','Security reasons flagged by Airbnb[Id Verification Not Completed]','2019-01-13','Transaction Cancelled');


/*Insert Statement[20] refund table*/
INSERT INTO refund
VALUES('RF0010','L001','G0010','H001','CAN0010','REC002','2022-10-06','No Refund Applicable'),
('RF0014','L0017','G0014','H0017','CAN0014','REC005','2024-06-07','Partial Refund Processing'),
('RF0016','L0018','G0016','H0018','CAN0016','REC006','2025-03-23','Refund Not Applied'),
('RF006','L0019','G006','H0019','CAN0019','REC006','2023-07-29','Full Refund Initiated'),
('RF004','L006','G004','H006','CAN004','REC0011','2024-09-23','No Refund Applicable'),
('RF001','L0015','G001','H0015','CAN001','REC0013','2024-01-19','No Refund Applicable'),
('RF006','L008','G006','H008','CAN006','REC0015','2021-11-30','Partial Refund Initiated'),
('RF0020','L0016','G0020','H0016','CAN0020','REC0017','2019-10-03','Partial Refund Initiated'),
('RF0013','L0011','G0013','H0011','CAN0013','REC0019','2025-03-08','Full Refund Initiated'),
('REC0021','L002','G008','H002','CAN008','REC0021','2021-12-24', 'No Refund Applicable'),
('RF0019','L0019','G0019','H0019','CAN0019','REC0024','2021-12-19','Partial Refund Applicable'),
('RF0015','L001','G0015','H001','CAN0015','REC0026','2018-11-29','Partial Refund Processing'),
('RF0016','L0015','G0016','H0015','CAN0016','REC0028','2023-09-30','No Refund Applicable'),
('RF0013','L006','G0013','H006','CAN0013','REC0030','2024-04-21','Refund Not Applied'),
('RF001','L0014','G001','H0014','CAN0014','REC0032','2019-10-22','Providing a Full Refund'),
('RF0010','L0016','G0010','H0016','CAN0016','REC0033','2019-08-24','No Refund Applicable'),
('RF0011','L0012','G0011','H0012','CAN0012','REC0035','2023-12-23','Partial Refund Processing'),
('RF007','L0013','G007','H0013','CAN007','REC0036','2023-09-30','No Refund Applicable'),
('RF004','L0014','G004','H0014','CAN004','REC0038','2022-05-31','Partial Refund Initiated'),
('RF003','L0020','G003','H0020','CAN003','REC0039','2019-01-13','No Refund Applicable');



/*Insert statement[55] for the table country */
INSERT INTO country 
VALUES('C001','REG005','Australia'),
('C002','REG004','Austria'),
('C003','REG003','Bahrain'),
('C004','REG003','China'),
('C005','REG003','Cyprus'),
('C006','REG004','Czech Republic'),
('C007','REG004','Denmark'),
('C008','REG003','Egypt'),
('C009','REG005','Fiji'),
('C0010','REG004','Finland'),
('C0011','REG004','France'),
('C0012','REG005','French Polynesia'),
('C0013','REG004','Germany'),
('C0014','REG004','Greece'),
('C0015','REG003','India'),
('C0016','REG004','Italy'),
('C0017','REG003','Iran'),
('C0018','REG004','Ireland'),
('C0019','REG003','Japan'),
('C0020','REG003','Jordan'),
('C0021','REG001','Kenya'),
('C0022','REG003','Kuwait'),
('C0023','REG003','Lebanon'),
('C0024','REG003','Malaysia'),
('C0025','REG001','Mauritius'),
('C0026','REG001','Morocco'),
('C0027','REG001','Nigera'),
('C0028','REG004','Netherlands'),
('C0029','REG005','New Zealand'),
('C0030','REG004','Norway'),
('C0031','REG003','Oman'),
('C0032','REG003','Pakistan'),
('C0033','REG004','Poland'),
('C0034','REG005','Papua New Guinea'),
('C0035','REG003','Qatar'),
('C0036','REG004','Russia'),
('C0037','REG004','Romania'),
('C0038','REG005','Somoa'),
('C0039','REG003','Saudi Arabia'),
('C0040','REG001','Senegal'),
('C0041','REG003','Serbia'),
('C0042','REG004','Spain'),
('C0043','REG001','South Africa'),
('C0044','REG003','South Korea'),
('C0045','REG004','Sweden'),
('C0046','REG003','Syria'),
('C0047','REG001','Tunisia'),
('C0048','REG003','Thailand'),
('C0049','REG005','Tonga'),
('C0050','REG003','Turkey'),
('C0051','REG003','United Arab Emirates'),
('C0052','REG004','United Kingdom'),
('C0053','REG002','United States'),
('C0054','REG005','Vanauta'),
('C0055','REG003','VietNam');


/*Insert statement[6] for region table*/
INSERT INTO region 
VALUES('REG001', 'Africa'),
('REG002', 'Americas'),
('REG003', 'Asia'),
('REG004', 'Europe'),
('REG005', 'Oceania'),
('REG006', 'Polar');


/*Insert statement[20] for listing_category table*/
INSERT INTO listing_category
VALUES ('AID001', 'Lake View'),
('AID002', 'Mountain View'),
('AID003', 'Waterfront'),
('AID004', 'Shared Beach Access'),
('AID005', 'River View'), 
('AID006', 'Sea View'),
('AID007', 'Bay View'),
('AID008', 'Lake Access'),
('AID009', 'Park View'),
('AID0010', 'Garden View'),
('AID0011', 'Valley View'),
('AID0012', 'Beach Access- Beachfront'),
('AID0013', 'Sand Dunes View'),
('AID0014', 'Garden'),
('AID0015', 'Ocean View'),
('AID0016', 'City Skyline View'),
('AID0017', 'Star Gazing'),
('AID0018', 'Private Patio or Balcony'),
('AID0019', 'Private Back Garden'),
('AID0020', 'Indoor Fireplace'),
('AID0021', 'Vineyard View'),
('AID0022', 'Kitchen');



/*Insert statement[75] for amenities_category table*/
INSERT INTO amenities_categories
VALUES('ACID001-1','Bathroom','Bath'),
('ACID001-2','Bathroom','Hair Dryer'),
('ACID001-3','Bathroom','Cleaning Products'),
('ACID001-4','Bathroom','Shampoo'),
('ACID001-5','Bathroom','Conditioner'),
('ACID001-6','Bathroom','Body Soap'),
('ACID001-7','Bathroom','Hot Water'),
('ACID001-8','Bathroom','Shower Gel'),
('ACID001-9','Bathroom','Bidet'),
('ACID002-1','Bedroom & Laundry','Essentials(Towels, Bedsheets, Soap and Toilet Paper)'),
('ACID002-2','Bedroom','Hangers'),
('ACID002-3','Bedroom','Bed Linen'),
('ACID002-4','Bedroom','Iron'),
('ACID002-5','Bedroom','Clothes Storage: Wardrobe'),
('ACID002-6','Bedroom','Free Washing Machine'),
('ACID002-7','Bedroom','Extra Pillows and Blankets'),
('ACID002-8','Bedroom','Room-Darkening Blinds'),
('ACID002-9','Bedroom','Mosquito Net'),
('ACID003-1','Entertainment','Books and Reading Materials'),
('ACID003-2','Entertainment','HDTV with Netflix'),
('ACID003-3','Entertainment','Pocket Wifi'),
('ACID003-3','Entertainment','Ethernet Connection'),
('ACID003-4','Entertainment','Sound System'),
('ACID003-5','Entertainment','Games Console'),
('ACID003-6','Entertainment','Exercise Equipment'),
('ACID003-7','Entertainment','Board Games'),
('ACID004-1','Family','Cot'),
('ACID004-2','Family','Travel Cot: Available Upon Request'),
('ACID004-3','Family','Children''s TableWare'),
('ACID004-4','Family','Babysitter Recommdations'),
('ACID005-1','Heating & Cooling','Indoor Fireplace'),
('ACID005-2','Heating & Cooling','Ceiling Fan'),
('ACID005-3','Heating & Cooling','Heating'),
('ACID005-4','Heating & Cooling','Window AC Unit'),
('ACID006-1','Home Safety','Fire Extinguisher'),
('ACID006-2','Home Safety','First-Aid Kit'),
('ACID006-3','Home Safety','Smoke Alarm'),
('ACID006-4','Home Safety','CarbonMonoxide Alarm'),
('ACID007-1','Internet & Office','Wifi'),
('ACID007-2','Internet & Office','Dedicated WorkSpace'),
('ACID008-1','Kitchen & Dining','Kitchen(Space where guests can cook their own meals)'),
('ACID008-2','Kitchen & Dining','Fridge'),
('ACID008-3','Kitchen & Dining','Microwave'),
('ACID008-4','Kitchen & Dining','Cooking Basics'),
('ACID008-5','Kitchen & Dining','Dishes and Cutlery'),
('ACID008-6','Kitchen & Dining','Freezer'),
('ACID008-7','Kitchen & Dining','Dishwasher'),
('ACID008-8','Kitchen & Dining','Cooker'),
('ACID008-9','Kitchen & Dining','Oven'),
('ACID008-10','Kitchen & Dining','Kettle'),
('ACID008-11','Kitchen & Dining','Coffee Maker: Nespresso'),
('ACID008-12','Kitchen & Dining','Wine Glass'),
('ACID008-13','Kitchen & Dining','Toaster'),
('ACID008-14','Kitchen & Dining','Baking Sheet'),
('ACID008-15','Kitchen & Dining','Blender'),
('ACID008-16','Kitchen & Dining','Barbecue Untensils'),
('ACID008-17','Kitchen & Dining','Dining Table'),
('ACID008-18','Kitchen & Dining','Coffee'),
('ACID008-19','Kitchen & Dining','Mini Frezeer'),
('ACID008-20','Kitchen & Dining','Gas Cooker'),
('ACID009-1','Location Features','Private Entrance'),
('ACID009-2','Location Features','Launderette Nearby'),
('ACID009-3','Location Features','Outdoor Furniture'),
('ACID009-4','Location Features','Sun Loungers'),
('ACID009-5','Location Features','Hammock'),
('ACID009-6','Location Features','Kayak'),
('ACID0010-1','Parking & Facilities','Free Parking on Premises'),
('ACID0010-2','Parking & Facilities','Free Parking on Street'),
('ACID0010-3','Parking & Facilities','Lift'),
('ACID0011-1','Services','Pets Allowed'),
('ACID0011-2','Services','Luggage Drop-Off Allowed'),
('ACID0011-3','Services','Long-Term Stays Allowed'),
('ACID0011-4','Services','Self Check-In'),
('ACID0011-5','Services','Lockbox'),
('ACID0011-6','Services','Host Greets You');


/*Insert statement[78] for city table*/
INSERT INTO city 
VALUES('COO1','C0043','Woleseley'),
('COO2','C0044','Sindun-myeon'),
('COO3','C0045','Brålanda'),
('COO4','C0013','Göppingen'),
('COO5','C0030','Raelingen'),
('COO6','C0014','Pyrgos Kallistis'),
('COO7','C002','Deutschlandsberg'),
('COO8','C001','Forth'),
('COO9','C0053','Los Angeles'),
('COO10','C0015','Manali'),
('COO11','C0048','Doi Suthep-Pui'),
('COO12','C0010','Ounasvaara'),
('COO13','C0020','Wadi Rum'),
('COO14','C0055','Hạ Long'),
('COO15','C0050','Ortahisa'),
('COO16','C0052','Diggle'),
('COO17','C0019','Sellano'),
('COO18','C0016','Umbria'),
('COO19','C0025','Roches Noires'),
('COO20','C0026','Fès'),
('COO21','C0045','Stockholm'),
('COO22','C0052','Manchester'),
('COO23','C0015','Bengaluru'),
('COO24','C0021','Nairobi'),
('COO25','C00015','Hyderabad'),
('COO26','C0042','Madrid'),
('COO27','C0052','Glasgow'),
('COO28','C0052','New York'),
('COO29','C0024','Kuala Lumpur'),
('COO30','C0052','Leeds'),
('COO31','C0052','Bristol'),
('COO32','C0043','Cape Town'),
('COO33','C0017','Tehran'),
('COO34','C0013','Athens'),
('COO35','C0036','Mascow'),
('COO36','C0052','London'),
('COO37','C0040','Lagos'),
('COO38','C0040','Dakar'),
('COO39','C0032','Lahore'),
('COO40','C0052','Cambridge'),
('COO41','C0051','Dubai'),
('COO42','C0050','Istanbul'),
('COO43','C0011','Paris'),
('COO44','C0053','San Francisco'),
('COO45','C0013','Berlin'),
('COO46','C0044','Seoul'),
('COO47','C0047','Tunis'),
('COO48','C0023','Beirut'),
('COO49','C0010','Helsinki'),
('COO50','C0053','Miami'),
('COO51','C0028','Amsterdam'),
('COO52','C0052','Edinburgh'),
('COO53','C0052','York'),
('COO54','C0041','Belgrade'),
('COO55','C0024','Doha'),
('COO56','C005','Nicosia'),
('COO57','C0044','Tokyo'),
('COO58','C0033','Kraków'),
('COO59','C004','Shanghai'),
('COO60','C0016','Rome'),
('COO61','C0039','Riyadh'),
('COO62','C007','Copenhagen'),
('COO63','C008','Cairo'),
('COO64','C0033','Warsaw'),
('COO65','C003','Manama'),
('COO66','C006','Prague'),
('COO67','C0020','Amman'),
('COO68','C0037','Bucharest'),
('COO69','C0022','Salmiya'),
('COO70','C0031','Muscat'),
('COO71','C0046','Damascus'),
('COO72','C0028','Auckland'),
('COO73','C0038','Apia'),
('COO74','C009','Suva'),
('COO75','C0012','Tahiti'),
('COO76','C0049','Nuku''alofa'),
('COO77','C0054','Port Villa'),
('COO78','C0034','Port Moresby');


/*Insert statement[80] for location table*/
INSERT INTO location 
VALUES('LO001','NG001','Western Cape'),
('LO002','NG002','Icheon-si'),
('LO003','NG003','Västra Götalands län'),
('LO004','NG004','Baden-Württemberg'),
('LO005','NG005','Akershus'),
('LO006','NG006','Santorini'),
('LO007','NG007','Steiermark'),
('LO008','NG008','Tasmania'),
('LO009','NG009','California'),
('LO0010','NG0010','Himachal Pradesh'),
('LO0011','NG0011','Chiang Mai'),
('LO0012','NG0012','Rovaniemi'),
('LO0013','NG0013','Aqaba Governorate'),
('LO0014','NG0014','Quảng Ninh'),
('LO0015','NG0015','Nevsehir'),
('LO0016','NG0016','England'),
('LO0017','NG0017','Shimane Prefecture'),
('LO0018','NG0018','Umbria'),
('LO0019','NG0019','Rivière du Rempart'),
('LO0020','NG0020','Fès-Meknès'),
('LO0021','NG0021','Kungsbron'),
('LO0022','NG0022','Cross Street'),
('LO0023','NG0023','Gandhi Nagar'),
('LO0024','NG0024','Bernard'),
('LO0025','NG0025','Darus Salam'),
('LO0026','NG0026','Calle Del Olmo'),
('LO0027','NG0027','Monteith Row'),
('LO0028','NG0028','Soho'),
('LO0029','NG0029','Lorong Mayang'),
('LO0030','NG0030','Park Row'),
('LO0031','NG0031','WhiteHouse lane'),
('LO0032','NG0032','Dorp Street'),
('LO0033','NG0033','Mohsen Safavi'),
('LO0034','NG0034','Sfakion'),
('LO0035','NG0035','Kalashnyy Lane'),
('LO0036','NG0036','New Kent Road'),
('LO0037','NG0037','Surulere'),
('LO0038','NG0038','Almadies'),
('LO0039','NG0039','Shish Mahal Road'),
('LO0040','NG0040','Gilbert Road'),
('LO0041','NG0041','Al-khaleej Street'),
('LO0042','NG0042','Fatih'),
('LO0043','NG0043','Rue Madame'),
('LO0044','NG0044','Vanenssa Ave'),
('LO0045','NG0045','Nue Blumenstraße'),
('LO0046','NG0046','Jong-Ro'),
('LO0047','NG0047','Sidi El Béchir'),
('LO0048','NG0048','Basra'),
('LO0049','NG0049','Kruununhaka'),
('LO0050','NG0050','W Flagler St'),
('LO0051','NG0051','Utrechtsestraat'),
('LO0052','NG0052','Blackford St.'),
('LO0053','NG0053','Micklegate'),
('LO0054','NG0054','Lomina'),
('LO0055','NG0055','Hadramount St'),
('LO0056','NG0056','Omirou Lane'),
('LO0057','NG0057','Shinjuku-Dori Avenue'),
('LO0058','NG0058','Swietej Anny'),
('LO0059','NG0059','Xietu Road'),
('LO0060','NG0060','Via Roma'),
('LO0061','NG0061','King Fahd Rd'),
('LO0062','NG0062','Nyhavn'),
('LO0063','NG0063','Tahrir Square'),
('LO0064','NG0064','Nowy Świat'),
('LO0065','NG0065','Diplomatic Area Building'),
('LO0066','NG0066','Václavské náměstí'),
('LO0067','NG0067','Rainbow Street'),
('LO0068','NG0068','Calea Victoriei'),
('LO0069','NG0069','Salem Al Mubarak'),
('LO0070','NG0070','Grafton Street'),
('LO0071','NG0071','Al Khuwair Street'),
('LO0072','NG0072','Straight Steet'),
('LO0073','NG0073','Kauri Rd'),
('LO0074','NG0074','Beach Rd'),
('LO0075','NG0075','Suva St'),
('LO0076','NG0076','Papeete Ave'),
('LO0078','NG0078','Vuna Rd'),
('LO0079','NG0079','Port Villa Rd'),
('LO0080','NG0078','Ela Beach');



/*Insert statement[79] for neighborhood table*/
INSERT INTO neighborhood 
VALUES('NG001','COO1','Romansrivier'),
('NG002','COO2','Sunam-RI'),
('NG003','COO3','Sörbo'),
('NG004','COO4','Stauferpark'),
('NG005','COO5','Smestad'),
('NG006','COO6','Artemis Karamolegos'),
('NG007','COO7','Klein-Preding'),
('NG008','COO8','Melrose'),
('NG009','COO9','Downtown-Los Angeles'),
('NG0010','COO10','Jagatsukh'),
('NG0011','COO11','Rama-Lana'),
('NG0012','COO12','Vesalanperä'),
('NG0013','COO13','Rashid Canyon'),
('NG0014','COO14','Bãi Tâm'),
('NG0015','COO15','Hibe Dede Cd'),
('NG0016','COO16','Delph'),
('NG0017','COO17','Inahara'),
('NG0018','COO18','Molini di Orsano'),
('NG0019','COO19','Plaine des Roches'),
('NG0020','COO20','Andalous'),
('NG0021','COO21','Norrmalm'),
('NG0022','COO22','Hulme'),
('NG0023','COO23','Halasuru'),
('NG0024','COO24','Kilimani'),
('NG0025','COO25','Banjara Hills'),
('NG0026','COO26','Getafe'),
('NG0027','COO27','Govanhill'),
('NG0028','COO28','Union City'),
('NG0029','COO29','Hulu Langat'),
('NG0030','COO30','Steander'),
('NG0031','COO31','Kingsdown'),
('NG0032','COO32','Paarden Eiland'),
('NG0033','COO33','Amirieh'),
('NG0034','COO34','Kypseli'),
('NG0035','COO35','Tverskoy'),
('NG0036','COO36','Camden'),
('NG0037','COO37','Telheiro'),
('NG0038','COO38','Cape Vert'),
('NG0039','COO39','Gulberg'),
('NG0040','COO40','Fulbourn'),
('NG0041','COO41','Al Jafilia'),
('NG0042','COO42','Kemal Kadin MH'),
('NG0043','COO43','Pantin'),
('NG0044','COO44','Hayes Valley'),
('NG0045','COO45','Schönefeld'),
('NG0046','COO46','Bucheon'),
('NG0047','COO47','Bab Bhar'),
('NG0048','COO48','Sadat'),
('NG0049','COO49','kaivokatu'),
('NG0050','COO50','Coral Gables'),
('NG0051','COO51','Noord'),
('NG0052','COO52','Calton'),
('NG0053','COO53','Haxby'),
('NG0054','COO54','Umka'),
('NG0055','COO55','Saba'),
('NG0056','COO56','Geni Tzami'),
('NG0057','COO57','Shinjuku'),
('NG0058','COO58','Stare Miasto'),
('NG0059','COO59','Xinzhuang'),
('NG0060','COO60','Lazio'),
('NG0061','COO61','Al-Woroud'),
('NG0062','COO62','Vesterbro'),
('NG0063','COO63','Shubra'),
('NG0064','COO64','Nowe Miasto'),
('NG0065','COO65','Shaikh Isa Ave'),
('NG0066','COO66','Prosek'),
('NG0067','COO67','Al-Urdon Street'),
('NG0068','COO68','Strada Danei'),
('NG0069','COO69','Hammad Al-Mubarak Street'),
('NG0070','COO70','Stoneybatter'),
('NG0071','COO71','Ruwi Street'),
('NG0072','COO72','Maysaloun Street'),
('NG0073','COO73','Eden Valley'),
('NG0074','COO74','Vaiala Road'),
('NG0075','COO75','Brown'),
('NG0076','COO76','Papara'),
('NG0077','COO77','Hala Niuloa'),
('NG0078','COO78','Ring Road'),
('NG0079','COO77','Mount Hagen');


/*Insert statement[9] for id_category table*/
INSERT INTO id_category
VALUES('IDC001','Email','Not Verified'),
('IDC002','Phone Number','Not Verified'),
('IDC003','Govt. Recognised Id','Not Verified'),
('IDC004','Email','In Process'),
('IDC005','Phone Number','In Process'),
('IDC006','Govt, Recognised Id','In Process'),
('IDC007','Email','Verified'),
('IDC008','Phone Number','Verified'),
('IDC009','Govt. Recognised Id','Verified'),
('IDC0010','All IDs','Verified');



/*Insert statement[60] for id_verification table*/
INSERT INTO id_verification
VALUES('IDVF00g1','IDC0010'),
('IDVF00g2','IDC0010'),
('IDVF00g3','IDC001'),
('IDVF00g4','IDC004'),
('IDVF00g5','IDC0010'),
('IDVF00g6','IDC0010'),
('IDVF00g7','IDC0010'),
('IDVF00g8','IDC002'),
('IDVF00g9','IDC0010'),
('IDVF0g10','IDC003'),
('IDVF0g11','IDC0010'),
('IDVF0g12','IDC0010'),
('IDVF0g13','IDC0010'),
('IDVF0g14','IDC0010'),
('IDVF0g15','IDC0010'),
('IDVF0g16','IDC0010'),
('IDVF0g17','IDC0010'),
('IDVF0g18','IDC0010'),
('IDVF0g19','IDC0010'),
('IDVF0g20','IDC0010'),
('IDVF00h1','IDC005'),
('IDVF00h2','IDC001'),
('IDVF00h3','IDC0010'),
('IDVF00h4','IDC0010'),
('IDVF00h5','IDC0010'),
('IDVF00h6','IDC0010'),
('IDVF00h7','IDC0010'),
('IDVF00h8','IDC0010'),
('IDVF00h9','IDC0010'),
('IDVF0h10','IDC0010'),
('IDVF0h11','IDC0010'),
('IDVF0h12','IDC0010'),
('IDVF0h13','IDC0010'),
('IDVF0h14','IDC0010'),
('IDVF0h15','IDC006'),
('IDVF0h16','IDC003'),
('IDVF0h17','IDC0010'),
('IDVF0h18','IDC0010'),
('IDVF0h19','IDC0010'),
('IDVF0h20','IDC002'),
('IDVF00a1','IDC004'),
('IDVF00a2','IDC0010'),
('IDVF00a3','IDC0010'),
('IDVF00a4','IDC003'),
('IDVF00a5','IDC0010'),
('IDVF00a6','IDC0010'),
('IDVF00a7','IDC0010'),
('IDVF00a8','IDC006'),
('IDVF00a9','IDC0010'),
('IDVF0a10','IDC0010'),
('IDVF0a11','IDC001'),
('IDVF0a12','IDC0010'),
('IDVF0a13','IDC0010'),
('IDVF0a14','IDC0010'),
('IDVF0a15','IDC0010'),
('IDVF0a16','IDC0010'),
('IDVF0a17','IDC002'),
('IDVF0a18','IDC0010'),
('IDVF0a19','IDC005'),
('IDVF0a20','IDC0010');


--New table pay_category created.
INSERT INTO pay_category
VALUES('PC0dc01','Card'),
('PC0cc02','Card'),
('PC0bc03','Bank Account'),
('PC0oa104','PayPal'),
('PC0oa205','Apple Pay'),
('PC0oa306','Booking Credits');


/*Insert statement[40] for saved_payment_methods table*/
INSERT INTO saved_payment_methods
VALUES('G001','PC0cc02','Credit Card'),
('G002','PC0dc01','Debit Card'),
('G003','PC0oa306','Booking Credits'),
('G004','PC0oa104','PayPal'),
('G005','PC0dc01','Debit Card'),
('G006','PC0oa306','Booking Credits'),
('G007','PC0oa306','Booking Credits'),
('G008','PC0oa104','PayPal'),
('G009','PC0oa306','Booking Credits'),
('G0010','PC0oa205','Apple Pay'),
('G0011','PC0oa306','Booking Credits'),
('G0012','PC0cc02','Credit Card'),
('G0013','PC0dc01','Debit Card'),
('G0014','PC0oa306','Booking Credits'),
('G0015','PC0oa205','Apple Pay'),
('G0016','PC0oa306','Booking Credits'),
('G0017','PC0oa306','Booking Credits'),
('G0018','PC0dc01','Debit Card'),
('G0019','PC0oa306','Booking Credits'),
('G0020','PC0dc01','Debit Card'),
('H001','PC0bc03','Account Number'),
('H002','PC0dc01','Debit Card'),
('H003','PC0cc02','Credit Card'),
('H004','PC0oa104','PayPal'),
('H005','PC0dc01','Debit Card'),
('H006','PC0bc03','Account Number'),
('H007','PC0dc01','Debit Card'),
('H008','PC0oa104','PayPal'),
('H009','PC0dc01','Debit Card'),
('H0010','PC0oa205','Apple Pay'),
('H0011','PC0bc03','Account Number'),
('H0012','PC0bc03','Account Number'),
('H0013','PC0dc01','Debit Card'),
('H0014','PC0bc03','Account Number'),
('H0015','PC0oa205','Apple Pay'),
('H0016','PC0bc03','Account Number'),
('H0017','PC0bc03','Account Number'),
('H0018','PC0dc01','Debit Card'),
('H0019','PC0cc02','Credit Card'),
('H0020','PC0dc01','Debit Card');


/*Insert statement[20] for wishlists table*/
INSERT INTO wishlists
VALUES('WL001','L0020','G001','Wishlist_1'),
('WL002','L0019','G002','Wishlist_2'),
('WL003','L0018','G003','Wishlist_3'),
('WL004','L0017','G004','Wishlist_4'),
('WL005','L0016','G005','Wishlist_5'),
('WL006','L0015','G006','Wishlist_6'),
('WL007','L0014','G007','Wishlist_7'),
('WL008','L0013','G008','Wishlist_8'),
('WL009','L0012','G009','Wishlist_9'),
('WL0010','L0011','G0010','Wishlist_10'),
('WL0011','L0010','G0011','Wishlist_11'),
('WL0012','L009','G0012','Wishlist_12'),
('WL0013','L008','G0013','Wishlist_13'),
('WL0014','L007','G0014','Wishlist_14'),
('WL0015','L006','G0015','Wishlist_15'),
('WL0016','L005','G0016','Wishlist_16'),
('WL0017','L004','G0017','Wishlist_17'),
('WL0018','L003','G0018','Wishlist_18'),
('WL0019','L002','G0019','Wishlist_19'),
('WL0020','L001','G0020','Wishlist_20');


/*Insert statement[20] for listing_avail table*/
INSERT INTO listing_avail
VALUES('LA001','L001',1,1,2,'Adults Only',True,2),
('LA002','L002',1,1,2,'Adults Only',False,0),
('LA003','L003',4,2,6,'All Ages Allowed',True,3),
('LA004','L004',2,1,2,'Adults Only',False,0),
('LA005','L005',6,3,8,'All Ages Allowed',True,3),
('LA006','L006',6,3,8,'Adults Only',False,0),
('LA007','L007',20,10,25,'All Ages Allowed',True,9),
('LA008','L008',6,3,8,'Adults Only',True,3),
('LA009','L009',3,2,4,'All Ages Allowed',False,0),
('LA0010','L0010',3,2,4,'All Ages Allowed',False,0),
('LA0011','L0011',8,3,9,'All Ages Allowed',True,3),
('LA0012','L0012',8,4,8,'All Ages Allowed',True,4),
('LA0013','L0013',8,3,8,'All Ages Allowed',True,4),
('LA0014','L0014',15,6,15,'All Ages Allowed',True,6),
('LA0015','L0015',3,2,4,'All Ages Allowed',False,0),
('LA0016','L0016',2,1,2,'Adults Only',True,2),
('LA0017','L0017',6,3,8,'Adults Only',False,0),
('LA0018','L0018',3,2,5,'All Ages Allowed',True,2),
('LA0019','L0019',8,3,9,'All Ages Allowed',True,3),
('LA0020','L0020',2,1,2,'Adults Only',True,1);

/*Insert statement[20] for amenities table*/
INSERT INTO amenities 
VALUES('L001','AMID001','AID001,AID002,AID003,AID0010,AID0011','ACID001-1,ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID002-1ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID003-1,ACID004-1,ACID004-2,ACID004-3,ACID004-4,ACID005-1,ACID005-2,ACID005-3,ACID006-1,ACID006-2,ACID007-1,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-13,ACID008-14,ACID008-15,ACID008-16,ACID008-17,ACID008-18,ACID007-2,ACID0010-1,ACID0011-1,ACID0011-2,ACID0011-3,ACID0011-4,ACID0011-5,ACID0010-2','LA001'),
('L002','AMID002','AID001,AID004','ACID001-1,ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID001-9,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-6,ACID002-7,ACID003-1,ACID003-2,ACID004-3,ACID005-3,ACID005-4,ACID006-1,ACID006-3,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-3ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-13,ACID008-14,ACID008-15,ACID008-16,ACID008-17,ACID008-18,ACID009-1,ACID0010-1,ACID0010-2,ACID0011-2,ACID0011-3,ACID0011-6','LA002'),
('L003','AMID003', 'AID001,AID004,AID0018,AID0019,AID0022','ACID001-3,ACID001-7,ACID002-1,ACID002-3,ACID002-4,ACID003-3,ACID004-1,ACID004-2,ACID004-3,ACID004-4,ACID005-3,ACID006-3,ACID006-1,ACID006-2,ACID007-2,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID009-1,ACID009-3,ACID0010-1,ACID0011-1,ACID0011-3,ACID0011-4,ACID0011-5','LA003'),
('L004','AMID004', 'AID009,AID0014,AID0018,AID0022','ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-7,ACID002-8ACID003-1,,ACID003-3,ACID005-3,ACID006-1,ACID006-2,ACID006-3,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-13,ACID008-17,ACID009-1,ACID009-3,ACID0010-1,ACID0010-2,ACID0010-3,ACID0011-2,ACID0011-6','LA004'),
('L005','AMID005', 'AID002,AID006,AID0019,AID0020,AID0022','ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-7,ACID003-3,ACID004-1,ACID004-2,ACID004-3,ACID004-4,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-13,ACID009-1,ACID009-3,ACID0010-1,ACID0011-1,ACID0011-3,ACID0011-4,ACID0011-5','LA005'),
('L006','AMID006', 'AID002,AID006,AID007,AID0011,AID0019,AID0021,AID0022','ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-7,ACID002-8,ACID002-9,ACID003-1,ACID003-2,ACID003-3,ACID003-4,ACID003-5,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-14,ACID008-16,ACID008-17,ACID009-1,ACID009-4,ACID0010-1,ACID0010-2,ACID0011-1,ACID0011-3','LA006'),
('L007','AMID007', 'AID001,AID002,AID006,AID008,AID009,AID0011,AID0014,AID0018,AID0021,AID0022','ACID001-2,ACID002-4,ACID002-6,ACID004-1,ACID004-2,ACID004-3,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-5,ACID008-6,ACID008-15,ACID008-16,ACID008-17,ACID009-1,ACID009-2,ACID009-3,ACID009-4,ACID009-5,ACID0011-1,ACID0011-2,ACID0011-6','LA007'),
('L008','AMID008', 'AID003,AID005,AID0010,AID0011,AID0018,AID0019,AID0020,AID0022','ACID001-1,ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-6,ACID002-7,ACID002-8,ACID003-1,ACID003-2,ACID003-4,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-8,ACID008-9,ACID008-10,ACID008-14,ACID008-15,ACID008-16,ACID008-17,ACID008-18,ACID009-4,ACID009-5,ACID009-6,ACID0010-1,ACID0010-2,ACID0011-1','LA008'),
('L009','AMID009', 'AID0016,AID0019,AID0022','ACID001-2,ACID001-4,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-6,ACID002-7,ACID003-1,ACID003-2,ACID003-5,ACID003-6,ACID003-7,ACID004-2,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-7,ACID008-9,ACID009-1,ACID009-3,ACID0010-1,ACID0010-3,ACID0011-3,ACID0011-4','LA009'),
('L0010','AMID0010','AID002,AID005,AID008,AID0010,AID0011,AID0018,AID0019,AID0020','ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-6,ACID002-7,ACID002-8,ACID005-1,ACID005-2,ACID006-1,ACID006-2,ACID007-1,ACID007-2,ACID008-3,ACID008-5,ACID008-10,ACID008-11,ACID008-12,ACID008-18,ACID009-1,ACID009-2,ACID0010-2,ACID0011-2,ACID0011-6','LA0010'),
('L0011','AMID0011', 'AID0010,AID0014,AID0019,AID0022','ACID001-2,ACID001-4,ACID001-7,ACID002-1,ACID002-2,ACID004-3,ACID005-4,ACID006-1,ACID006-2,ACID007-1,ACID007-2,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-16,ACID009-1,ACID0010-1,ACID0011-1,ACID0011-4','LA0011'),
('L0012','AMID0012', 'AID0014,AID008,AID0012,AID0017,AID0020,AID0022','ACID001-2,ACID001-3,ACID001-4,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID003-2ACID004-2,ACID004-3,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-12,ACID009-1,ACID0010-1,ACID0011-1,ACID0011-2,ACID0011-3,ACID0011-4','LA0012'),
('L0013','AMID0013', 'AID0013,AID0014,AID0017,AID0020','ACID001-7,ACID002-1,ACID002-3,ACID002-7,ACID004-1,ACID004-2,ACID004-3,ACID004-4,ACID006-2,ACID0010-1,ACID0010-2,ACID0011-1,ACID0011-2,ACID0011-6','LA0013'),
('L0014','AMID0014', 'AID003,AID0015,AID0017,AID0018,AID0020','ACID001-1,ACID003-2,ACID004-1,ACID004-2,ACID004-3,ACID004-4,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID007-2,ACID008-19,ACID009-4,ACID009-5,ACID0010-1,ACID0011-1','LA0014'),
('L0015','AMID0015', 'AID002,AID005,AID0018,AID0020,AID0022','ACID001-1,ACID001-2,ACID001-4,ACID001-7,ACID002-1,ACID002-2,ACID002-4,ACID003-2,ACID004-1,ACID004-2,ACID005-3,ACID006-1,ACID007-1,ACID008-1,ACID008-2,ACID008-4,ACID008-5,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-16,ACID008-17,ACID0010-1,ACID0010-2,ACID0011-2,ACID0011-3,ACID0011-6','LA0015'),
('L0016','AMID0016', 'AID002,AID0010,AID0011,AID0018,AID0019,AID0020,AID0022','ACID001-1,ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-7,ACID002-8,ACID003-2,ACID004-1,ACID004-2,ACID005-1,ACID005-2,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID007-2,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-12,ACID008-13,ACID008-14,ACID008-15,ACID008-16,ACID008-17,ACID008-18,ACID008-19,ACID008-20,ACID009-1,ACID009-4,ACID0010-1,ACID0010-2,ACID0011-1,ACID0011-2,ACID0011-3,ACID0011-4,ACID0011-5','LA0016'),
('L0017','AMID0017', 'AID0018,AID0019,AID0020','ACID001-2,ACID001-4,ACID001-7,ACID002-6,ACID002-1,ACID002-2,ACID002-3,ACID003-2,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID007-1,ACID0010-1,ACID0010-2,ACID0011-2,ACID0011-3,ACID0011-6','LA0017'),
('L0018','AMID0018', 'AID009,AID0010,AID0011,AID0014,AID0018,AID0019','ACID001-2,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID001-9,ACID002-1,ACID003-1,ACID003-2,ACID007-1,ACID007-2,ACID008-11,ACID008-18,ACID009-1,ACID0010-1,ACID0011-1,ACID0011-6','LA0018'),
('L0019','AMID0019', 'AID006,AID0012,AID0014,AID0015,AID0017,AID0018,AID0022','ACID001-3,ACID001-7,ACID001-9,ACID002-1ACID002-3,ACID002-4,ACID002-5,ACID003-1,ACID003-2,ACID003-4,ACID004-3,ACID004-4,ACID005-1,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID008-1,ACID008-2,ACID008-3,ACID008-4,ACID008-5,ACID008-6,ACID008-7,ACID008-8,ACID008-9,ACID008-10,ACID008-11,ACID008-12,ACID008-13,ACID008-14,ACID008-15,ACID008-16,ACID008-17,ACID008-18,ACID008-19,ACID008-20,ACID009-1,ACID009-3,ACID009-4,ACID009-5,ACID009-6,ACID0011-1,ACID0011-6','LA0019'),
('L0020','AMID0020', 'AID0016,AID0018,AID0022','ACID001-2,ACID001-3,ACID001-4,ACID001-5,ACID001-6,ACID001-7,ACID001-8,ACID001-9,ACID002-1,ACID002-2,ACID002-3,ACID002-4,ACID002-5,ACID002-6,ACID002-7,ACID003-1,ACID003-2,ACID003-3,ACID004-1,ACID004-2,ACID005-3,ACID005-4,ACID006-1,ACID006-2,ACID006-3,ACID006-4,ACID007-1,ACID007-2,ACID008-4,ACID008-5,ACID008-11,ACID008-12,ACID008-17,ACID008-18,ACID009-1,ACID009-2,ACID0011-1,ACID0011-2,ACID0011-3,ACID0011-4,ACID0011-5','LA0020');


/*Insert statement[92] for msg table*/
INSERT INTO msg
VALUES('MSG00h1','Hello, Thank you for booking your stay with us. We are excited to welcome you and feel free to ask any questions you may have!','21:18'),
('MSG00g1','Thank you for the message. Could you please confirm the check-in time?','13:02'),
('MSG00h1','Of course! the earliest check-in time is from 2:00 pm but, if you need to arrive earlier, just let me know and I will do my best to accommodate you','14:09'),
('MSG00g1','Yeah sure. I will let you know if that is the case.','01:45'),
('MSG00h2','Hello, thank you so much for booking with us. Is there anything I can help you with?','00:23'),
('MSG00g7','Hi, So it was mentioned in the description that there is someone who also teaches to play a music intsrument of our choice. Is this still valid?','17:17'),
('MSG00h2','Hi, yeah, it is still valid although when you check-in, there is a list of instruments that you can select from that is included with listing-booking. If you decide an instrument that is not int he list you will have to pay externally for that service.','02:37'),
('MSG00g7','Okay, thank you! I will contact you if there is anything else that is needed.','05:27'),
('MSG00h4','Hi, is there anything I can help you with? Please let know','18:04'),
('MSG00g18','Hello, I am actually an art student, preparing for finals and was looking for an inspiration. Can I use your place as an inspiration?','09:16'),
('MSG00h4','Hello, I am so excited for this. Yes you may use this for your inspiration. All the very best for your final. Can I ask for a favor though?','06:16'),
('MSG00g18','Yes please','22:22'),
('MSG00h4','If possible, can we have have painting once it is done and possible for you to give us?. We can pay you for the painting.','20:17'),
('MSG00g18','Yes ofcourse','15:15'),
('MSG00h7','Hi, thank you for booking with us, we are looking forword to host you!','13:09'),
('MSG00g14','Hi, thank you. We have some requests as this is a post-wedding celebration!','23:45'),
('MSG00h7','Hello, many congrats! how can we help?','15:29'),
('MSG00g14','Hi, we just require one honeymoon suite and an open space where we can dance?','16:01'),
('MSG00h7','Yes sure, that would be done the materials used will be charged though, is it okay?','06:23'),
('MSG00g14','yes that is okay. let us know if there is anything else','12:49'),
('MSG00h7','okay, congrats once again!','01:17'),
('MSG00h8','Hello, thank you for booking with us, is there anything we can do to help?','17:01'),
('MSG00g12','Hi, there are no requests from us, but thanks for asking though!','20:23'),
('MSG00h9','Hello, Is there anything special you are hoping from us to do?','13:15'),
('MSG00g2','Hello, since this is a business trip, there are no requests from me, thank you so much for asking!','05:21'),
('MSG00h10','Hi, thank you for selecting to stay with us! Are there any questions for us? feel free to reach out!','16:05'),
('MSG00g14','Greetings, thank you dor reaching out. I do have some questions. I actually want to cancel my booking as something came up that cannot be re-scheduled. Will I get a refund?','06:12'),
('MSG00h10','Hello, thank you for reaching out. Is there any possibility that you can re-schedule from current dates to another dates?','00:57'),
('MSG00g14','Yes actually, I want to re-schedule to next week same details, is this possible?','11:09'),
('MSG00h10','Hi, yes that is possible. Should I re-schedule and confirm it for next week?','18:30'),
('MSG00g14','Yes please. That would be great. Thanks!','23:01'),
('MSG00h12','Hello, feel free to ask any questions you many have! Thank you for staying with us!','03:06'),
('MSG00g9','Hi, are the northern lights really visible? Actually we are a group of professional photographers and we want to use this place for our term finals. Can this place be used? ','06:40'),
('MSG00h12','Hello, yes, the northern lights are really visible. And yes you may use this place for your assignment.','11:29'),
('MSG00g9','We also wanted you to know that we are leaving samples behind- one from all of us so that, 5 in total for you to select and use. ','08:28'),
('MSG00g20','Hi, there are few changes in our travel plans so I wanted to cancel this booking.','03:33'),
('MSG00h16','Hello, Is there any chance for a reschedule?','18:10'),
('MSG00g20','Hi, I do not think so, but if there is any chance, I will book again.','10:15'),
('MSG00h16','Okay. Thanks. Have a safe journey.','15:29'),
('MSG00h17','Hi, If you have any questions, do let us know. Thank you for booking with us.','00:47'),
('MSG00g3','Hi, what are the food preferences or availability?','21:01'),
('MSG00h17','Hi, there is a food menu prepared for everyday with a speciality and desert. You may request for a dish or meal, but it costs extra if the costs exceeds from the limit. ','11:11'),
('MSG00g3','Hi, okay thanks!','01:01'),
('MSG00h18','Hello, Thank you for booking your stay with us. We are excited to welcome you and feel free to ask any questions you may have!','05:45'),
('MSG00g2','Hi, what is the earliest check-in time?','02:00'),
('MSG00h18','The earliest is 10:00 am and the last timing for chek-in is is 2:00 pm','13:00'),
('MSG00g2','Okay, thanks','10:00'),
('MSG00h19','Hello, I hope you are doing well. I regret to inform you that your booking was cancelled due to property damages on the property.','01:00'),
('MSG00g6','Hi, so is this going to be reschedule or how is this going forward?','03:00'),
('MSG00h19','Hi, I am providing you a full refund. You can re-book from the available dates if you like. Thanks for understanding.','21:00'),
('MSG00g6','Okay thanks!','17:00'),
('MSG00h20','Good day. thank you for your boooking. Are there any questions you would like to ask?','15:00'),
('MSG00g19','Yes, actually. Are there any museums or historical places to visit nearby?','18:00'),
('MSG00h20','There are a few places. I will prepare a list for you and it will be given while you check-in. Is that fine?','19:00'),
('MSG00g19','Yeah, that would be great. thanks a lot.','14:00'),
('MSG00h8','Hello, thank you for booking with us, is there anything we can do to help?','04:00'),
('MSG00g1','Hi, thank you for your help, but all is good!','03:00'),
('MSG00h13','Hi, Thank you for booking with us.We are excited to welcome you and feel free to ask any questions you may have!','06:00'),
('MSG00g3','Hello, There are no questions. thank you for asking though.','11:00'),
('MSG00g6','Good day, I wanted to know if I am eligible for a refund as I applied for a cancellation.','09:00'),
('MSG00h8','Hello, Good day. May I know the reason for this cancellation?','19:19'),
('MSG00g6','Hi, Yeah so I am not availale on the booking dates and hence the cancellation.','23:00'),
('MSG00h8','Okay, you maybe be able to recieve a refund. whatever the cost, you will get refund. Thanks!','21:19'),
('MSG00h9','Hello, Is there anything special you are hoping from us to do?','19:17'),
('MSG00g8','Hi, there are no special requests as this is a business trip, thanks for asking though.','14:39'),
('MSG00h10','Hi, thank you for selecting to stay with us! Are there any questions for us? feel free to reach out!','15:37'),
('MSG00g9','Hello. We actually wanted to know more about kayaking as mentioned in the description. Will there an instructor or will we be on our own? Also how safe is it?','17:19'),
('MSG00h10','Greetings! Yes there will be an instructor provided and we take all the possible precautions. Our instructor is a trained kayaker and there are selected ways on which we take our guests for kayak rides. More information will be provided when the guests have check-in ','23:19'),
('MSG00h3','Hello, Thank you for booking your stay with us. We are excited to welcome you and feel free to ask any questions you may have!','17:21'),
('MSG00g12','Thank you. I wanted to ask that is there a baby cot available?','05:09'),
('MSG00h3','Yes, we have a baby cot available and it can be used for children for upto 3 years old. We also have pillows according to small babies available. You can choose from the available pillows.','18:26'),
('MSG00g12','Okay, thank you for this. I am really grateful.','00:45'),
('MSG00g13','Hi, there has been some unexpected weather events due to which we have to cancel the booking','00:57'),
('MSG00h11','Hello, I hope you are well. What has happened, if I may ask.','09:51'),
('MSG00g13','Hi, yeah actually there has been constant rain here due to which the flights have been delayed and some of them are cancelled. ','03:59'),
('MSG00h11','Oh, I hope all is well. It is no issue and I will see what I can do. ','23:49'),
('MSG00g13','Thanks so much.','07:07'),
('MSG00g14','Hello, I actually want to know more about your cancellation policy as because of some reason I will have to cancel the booking.','04:52'),
('MSG00h17','Hello, I hope you found this well. Since it has been more than 24 hours, you are eligible for partial refund. You can apply for a refund but you will only receive partial refund. ','18:01'),
('MSG00g14','Hi, That is okay, thanks for your help','01:45'),
('MSG00h13','Hi, Thank you for booking with us.We are excited to welcome you and feel free to ask any questions you may have!','22:57'),
('MSG00g16','Hi, I wanted to ask is pet food available?','20:05'),
('MSG00h13','Hi, Yes it is available.','17:09'),
('MSG00g16','Hi, Thanks!','01:06'),
('MSG00h1','Hello, Thank you for booking your stay with us. We are excited to welcome you and feel free to ask any questions you may have!','23:12'),
('MSG00g18','Hello, thanks so much! i would like to know that are there any good restaurants or cafes nearby that you would recommend?','06:59'),
('MSG00h1','Absolutely! There are several good options within walking distance. I will put together a list of them for you. Please let me if you have any preferences and i will make the list accordingly.','13:03'),
('MSG00g18','Thank you very much for your help! I really appreciate it. See you soon','23:29'),
('MSG00h3','Hello, Thank you for booking your stay with us. We are excited to welcome you and feel free to ask any questions you may have!','04:24'),
('MSG00g20','Hi, Are there pet food stores available nearby?','05:54'),
('MSG00h3','Hi, Yes there are several stores within 2 miles and we do keep pet food at the storage. Are there any specific requirements though?','19:01'),
('MSG00g20','Hello, thank you for your help, and we will let you know if there is anything more. thanks once again.','22:22');

-- INSERT STATEMENTS FOR THE AIRBNB DATABASE: END HERE;




-- SELECT STATEMENTS [FOR TESTING PURPOSES] FOR THE AIRBNB DATABASE: START HERE:

--TEST CASE 1
/*SELECT * FROM booking
WHERE booking_status = 'Cancelled'
ORDER BY listing_id;*/

--TEST CASE 2
/*SELECT guest.guest_name, listing.listing_name, host.host_name, booking.booking_id, 
receipt.receipt_id, receipt.total_amt, booking.payable_amt, listing.is_security_deposit, 
receipt.security_deposit_status, booking.pay_method, booking.booking_status
FROM receipt
JOIN booking
	ON receipt.booking_id = booking.booking_id
JOIN listing
	ON listing.listing_id = booking.listing_id
JOIN host
	ON listing.host_id = host.host_id
JOIN guest
	ON booking.guest_id = guest.guest_id
ORDER BY booking.booking_id;*/

--TEST CASE 3
/*SELECT  host_name AS user_name,
host_email AS user_email, 
id_verification.id_verify AS verification_id, 
id_status AS id_verification_status
FROM id_verification
JOIN host
	ON host.id_verify = id_verification.id_verify
	JOIN id_category 
	ON id_verification.id_type_status = id_category.id_category_id
	WHERE id_verification.id_type_status = 'IDC0010'
UNION
SELECT guest_name, guest_email, guest.id_verify, id_status
FROM id_verification
JOIN guest
	ON guest.id_verify = id_verification.id_verify
	JOIN id_category 
	ON id_verification.id_type_status = id_category.id_category_id
	WHERE id_verification.id_type_status = 'IDC0010'
UNION
SELECT admin_name, admin_email, admin.id_verify, id_status
FROM id_verification
JOIN admin
	ON admin.id_verify = id_verification.id_verify
	JOIN id_category 
	ON id_verification.id_type_status = id_category.id_category_id
	WHERE id_verification.id_type_status = 'IDC0010'*/

-- SELECT STATEMENTS [FOR TESTING PURPOSES] FOR THE AIRBNB DATABASE: END HERE;
END;
