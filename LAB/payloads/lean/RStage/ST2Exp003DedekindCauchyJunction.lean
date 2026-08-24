/- ST2-EXP-003 research-only R reconvergence Junction.

   This source is admitted only after the post-H5 Study/Act decision recorded in
   ST2-EXP-003_H5_FIELD_ISOMORPHISM_AND_JUNCTION_STUDY_001.md.  It does not
   define a new real carrier, does not replace accepted R-BLOCK-001, and does
   not alter accepted C.  Its only purpose is to expose one auditable root that
   packages the two independently completed real producers together with the
   exact H5 field/order isomorphism between them. -/
namespace BOMA.R.StageTwo.DedekindCauchyJunction003

open BOMA.R.StageIntegration002
open BOMA.R.StageTwo.CauchyLUB003
open BOMA.R.StageTwo.DedekindCauchyComparison003

/-- Research reconvergence root for the completed accepted Dedekind producer
    and independently completed Cauchy producer.  The comparison component
    already contains the explicit mutually inverse maps and preservation of
    rational embedding, order, additive and multiplicative structure,
    nonzeroness, and the witness-only inverse relation. -/
structure DedekindCauchyResearchJunctionCertificate where
  acceptedDedekindRoute : RStageIntegrationCertificate
  independentCauchyRoute : CauchyLUBCertificate
  fieldIsomorphism : DedekindCauchyFieldIsomorphismCertificate

/-- The research-only R Junction.  No additional selector is introduced here;
    all logical commitments are inherited from the two completed routes and
    the already verified H5 comparison. -/
noncomputable def dedekindCauchyResearchJunctionCertificate :
    DedekindCauchyResearchJunctionCertificate where
  acceptedDedekindRoute := rStageIntegrationCertificate
  independentCauchyRoute := cauchyLUBCertificate
  fieldIsomorphism := dedekindCauchyFieldIsomorphismCertificate

end BOMA.R.StageTwo.DedekindCauchyJunction003
