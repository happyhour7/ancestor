exports.authorize = function(req, res, next) {
    if (!req.session.userid) {
        res.redirect('/admin/login');
    } else {
        next();
    }
}