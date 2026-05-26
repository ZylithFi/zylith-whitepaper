#import "style.typ": zylith_whitepaper

#show: doc => zylith_whitepaper(
  doc,
  title_text: "Zylith Whitepaper",
  title: [Zylith Whitepaper],
  version: [Protocol Specification v1.0-rc1],
  author_text: "Tanya Arora",
  author: [Tanya Arora],
  email: "tanya@zylith.fi",
  date: [May 2026],
  abstract: [
    Non-custodial trading on public blockchains exposes order intent before execution, trade history after settlement, and wallet behavior through the full onchain record. Zylith is a call-auction darkpool on Starknet that addresses these properties at the mechanism level rather than solely through cryptography.

    The core observation is that a fixed-epoch call auction avoids a class of timing leaks that continuous matching systems cannot eliminate through proof privacy alone. In a continuous system, settlement events are reactive: they occur when matches are found, so their timing is a direct function of private order arrival. In a fixed-epoch auction, the settlement event is tied to the protocol clock, which removes the reactive link between private order submission and public settlement timing as a structural property of the mechanism.

    Beyond timing, the structure of individual settlement transactions can reveal information even when proofs are zero-knowledge. In a continuous matching system each match produces a discrete onchain event with countable outputs and readable fee structure. Zylith's batch settlement carries Merkle root transitions and a padded output bundle reference rather than individual note ciphertexts, so transaction structure does not reveal fill count, participant count, or match shape.

    A further problem persists: even when individual settlement proofs are zero-knowledge, the sequence of public events around many settlements can reveal information. Settlement cadence, claim timing, gas-payer patterns, client retrieval behavior, and scheduler rhythm form a parallel information channel. This paper calls that channel the market access-pattern problem, defines a taxonomy of its leak surfaces, and describes the defense stack Zylith implements to address them.
  ],
)

#include "body.typ"
