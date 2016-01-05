exports.authorize = function(req, res, next) {
    if (!req.session.adminuserid) {
        res.redirect('/admin/login');
    } else {
        next();
    }
}