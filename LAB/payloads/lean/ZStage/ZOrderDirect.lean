/- Direct sign/magnitude order route on the selected signed carrier. -/
namespace BOMA.Z.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- Direct signed order. The payload of `pos a`/`neg a` is the predecessor
of the positive magnitude, so same-sign comparison uses the accepted N order
on those payloads; the negative case reverses it. -/
def zLEd : ZSigned → ZSigned → Prop
  | neg a, neg b => LE b a
  | neg _, zero => True
  | neg _, pos _ => True
  | zero, neg _ => False
  | zero, zero => True
  | zero, pos _ => True
  | pos _, neg _ => False
  | pos _, zero => False
  | pos a, pos b => LE a b

end BOMA.Z.Order001
