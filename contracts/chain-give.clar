;; Title: ChainGive - Decentralized Philanthropy Platform
;;
;; SUMMARY:
;; Revolutionary blockchain-powered philanthropic ecosystem that eliminates 
;; intermediaries between donors and causes. Built on Stacks, ChainGive 
;; transforms charitable giving through immutable transparency, automated 
;; milestone tracking, and democratic fund governance.
;;
;; DESCRIPTION:
;; ChainGive revolutionizes the philanthropic landscape by creating a trustless 
;; environment where every donation is tracked, every fund utilization is 
;; verified, and every impact is measurable. Our platform empowers donors with 
;; unprecedented visibility into their contributions while providing causes with 
;; streamlined access to global funding.
;;
;; Key Features:
;;   - Zero-trust donation infrastructure with immutable audit trails
;;   - Multi-tier governance system ensuring proper fund oversight
;;   - Automated milestone-based fund release mechanisms  
;;   - Real-time impact tracking and performance analytics
;;   - Democratic approval workflows for maximum accountability
;;   - Global accessibility with minimal transaction costs
;;
;; The future of giving is transparent, efficient, and powered by blockchain.

;; CONTRACT VARIABLES & CONSTANTS

;; Contract owner
(define-data-var contract-owner principal tx-sender)

;; Error constants - Comprehensive error handling system
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; Role definitions - Hierarchical access control
(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES

;; User role management system
(define-map roles
  { user: principal }
  { role: uint }
)

;; Beneficiary registry with comprehensive tracking
(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

;; Donation ledger with complete transaction history
(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

;; Fund utilization tracking with milestone-based approvals
(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)

;; COUNTERS & INDEXES

(define-data-var beneficiary-count uint u0)
(define-data-var donation-count uint u0)
(define-data-var utilization-count uint u0)

;; HELPER FUNCTIONS

;; Authorization validation with role-based permissions
(define-private (is-authorized
    (user principal)
    (required-role uint)
  )
  (let ((role-data (default-to { role: u0 } (map-get? roles { user: user }))))
    (>= (get role role-data) required-role)
  )
)

;; Milestone tracking helper
(define-private (get-last-milestone (beneficiary-id uint))
  (var-get utilization-count)
)